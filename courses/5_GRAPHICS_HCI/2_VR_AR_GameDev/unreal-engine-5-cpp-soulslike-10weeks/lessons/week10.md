# Tuần 10: Arena, Spawner và Final Build / Week 10: Arena, Spawner & Final Build

## Mục Tiêu / Objectives

Kết nối toàn bộ hệ thống thành game loop hoàn chỉnh và tạo build có thể bàn giao. / Integrate all systems into a complete game loop and produce a distributable build.

**Mục tiêu cụ thể:**
1. Tạo Enemy Spawner và nhiều wave.
2. Cấu hình AI Affiliation.
3. Tạo Elimination, Win và Lose events.
4. Xây End Widget và Restart.
5. Refactor, profiling, kiểm thử và packaging.

---

## Lý Thuyết / Theory

### 1. Game loop

```text
Start Arena → Spawn Wave → Combat → Wave Cleared
            → Next Wave → Boss Terra → Win/Lose → Restart
```

GameMode điều phối luật; Spawner quản lý spawn; Character phát elimination event; UI chỉ hiển thị state.

### 2. Affiliation

Generic Team ID giúp AI phân biệt Friendly, Neutral, Hostile và hỗ trợ Enemy vs Player/Enemy vs Enemy mà không hard-code class.

### 3. Definition of Done

Tính năng chỉ hoàn thành khi chạy trong packaged build, không chỉ trong Editor.

---

## Cảnh Báo Phát Hành / Release Warnings

> [!WARNING]
> Kiểm tra giấy phép mọi asset trước khi phân phối. Không đưa API key, tài khoản hoặc file cấu hình cá nhân vào build/repository. Luôn giữ source commit trước khi packaging và kiểm tra build trên máy sạch nếu có thể.

---

## Thực Hành / Hands-On

### Cấp độ 1: Spawner và wave

Tạo Spawner nhận danh sách enemy class/data, spawn point, số lượng và delay. Theo dõi enemy còn sống bằng elimination event.

### Cấp độ 2: End game

Tạo `OnArenaWon`, `OnPlayerDefeated`, End Widget và Restart Level. Khóa input gameplay khi màn hình kết thúc mở.

### Cấp độ 3: Polish và packaging

Thêm theme sound, camera shake tùy chỉnh, sửa warning, chạy profiling cơ bản, tạo Development build và test từ executable.

### Code 1 — Khái niệm nhỏ: wave definition data-driven

**File:** `Source/EchoesOfTerra/Game/ArenaWaveData.h`

```cpp
USTRUCT(BlueprintType)
struct FArenaSpawnEntry
{
    GENERATED_BODY()
    UPROPERTY(EditAnywhere) TSubclassOf<AEnemyCharacter> EnemyClass;
    UPROPERTY(EditAnywhere, meta=(ClampMin="1")) int32 Count = 1;
};

USTRUCT(BlueprintType)
struct FArenaWave
{
    GENERATED_BODY()
    UPROPERTY(EditAnywhere) TArray<FArenaSpawnEntry> Entries;
    UPROPERTY(EditAnywhere, meta=(ClampMin="0.0")) float SpawnInterval = 0.5f;
};
```

Wave là dữ liệu, không hard-code Terra hay số lượng trong GameMode. Validate class null và `Count <= 0` trước khi spawn.

**Xác minh:** thay Wave 1 từ 2 thành 3 enemy trong Editor mà không compile lại.

### Code 2 — Ví dụ trung gian: theo dõi elimination không bị đếm hai lần

**File:** `Source/EchoesOfTerra/Game/ArenaSpawner.cpp`

```cpp
void AArenaSpawner::RegisterEnemy(AEnemyCharacter* Enemy)
{
    if (!IsValid(Enemy) || AliveEnemies.Contains(Enemy)) return;
    AliveEnemies.Add(Enemy);
    Enemy->OnEliminated.AddUniqueDynamic(this, &ThisClass::HandleEnemyEliminated);
}

void AArenaSpawner::HandleEnemyEliminated(AActor* Eliminated)
{
    AEnemyCharacter* Enemy = Cast<AEnemyCharacter>(Eliminated);
    if (!Enemy || AliveEnemies.Remove(Enemy) == 0) return;
    Enemy->OnEliminated.RemoveDynamic(this, &ThisClass::HandleEnemyEliminated);
    if (AliveEnemies.IsEmpty() && PendingSpawnCount == 0)
        AdvanceWave();
}
```

`TSet<TObjectPtr<AEnemyCharacter>> AliveEnemies` và `PendingSpawnCount` ngăn wave kết thúc sớm khi spawn theo interval. Death/elimination phải idempotent từ tuần 7.

**Edge cases:** spawn fail, enemy rơi khỏi map, destroy không qua damage, player restart giữa timer. Hủy toàn bộ spawn timer trong `EndPlay` và xử lý spawn fail bằng cách giảm pending count.

### Code 3 — Lab tích hợp: kết thúc arena và restart sạch

**Files:** `Source/EchoesOfTerra/Game/SoulslikeGameMode.cpp`, `Source/EchoesOfTerra/UI/EndGameWidget.cpp`.

```cpp
void ASoulslikeGameMode::FinishArena(bool bPlayerWon)
{
    if (bArenaFinished) return;
    bArenaFinished = true;

    if (APlayerController* PC = UGameplayStatics::GetPlayerController(this, 0))
    {
        PC->SetIgnoreMoveInput(true);
        PC->SetIgnoreLookInput(true);
        PC->SetPause(false);
        EndWidget = CreateWidget<UEndGameWidget>(PC, EndWidgetClass);
        if (EndWidget)
        {
            EndWidget->SetResult(bPlayerWon);
            EndWidget->AddToViewport(100);
            PC->SetInputMode(FInputModeUIOnly());
            PC->bShowMouseCursor = true;
        }
    }
}

void UEndGameWidget::RestartArena()
{
    if (UWorld* World = GetWorld())
        UGameplayStatics::OpenLevel(this, FName(*World->GetName()), false);
}
```

Trong PIE, `World->GetName()` có thể mang prefix; production nên lưu `FName ArenaLevelName` trong GameMode/Data Asset và dùng tên asset ổn định. Button Restart bind một lần trong `NativeConstruct` bằng `AddUniqueDynamic`.

**Lab hoàn chỉnh:** cấu hình `DA_ArenaWaves` gồm 2 basic, 3 biến thể và Boss Terra; nối `OnDeath` của player tới `FinishArena(false)`, wave cuối tới `FinishArena(true)`. Package Development build qua Unreal Editor (`Platforms → <Target> → Package Project`) hoặc lệnh BuildCookRun phù hợp engine cài đặt.

**Expected result:** Win/Lose chỉ hiện một lần, input gameplay khóa, restart tạo đúng Wave 1 và không còn timer/delegate cũ. Chạy AT-01…AT-06 từ executable; lưu log, ảnh từng wave và video 2–4 phút làm bằng chứng.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Wave 1: hai enemy cơ bản.
- Wave 2: ba enemy cấu hình khác nhau.
- Boss Wave: Terra.

### 🟡 Phần B

- Tạo enemy mới chỉ bằng Data Asset.
- Tạo attack mới mà không sửa `PlayerCharacter`.
- Cấu hình team để kiểm tra Enemy vs Enemy.

### 🔴 Phần C: Final Project

Đóng gói Echoes of Terra, quay demo 2–4 phút và hoàn thiện README, DESIGN, TESTING. Xem yêu cầu chi tiết tại [Đồ án cuối khóa](../projects/final_project.md).

---

## Kiểm Thử Chấp Nhận / Acceptance Tests

| ID | Ca kiểm thử | Điều kiện đạt |
|---|---|---|
| AT-01 | Chơi từ đầu đến boss | Không có blocker |
| AT-02 | Player chết ở mỗi wave | Lose UI và Restart đúng |
| AT-03 | Hạ tất cả enemy | Wave tiếp theo bắt đầu một lần |
| AT-04 | Boss chết | Win UI chỉ mở một lần |
| AT-05 | Restart sau Win/Lose | State sạch, không duplicate spawn |
| AT-06 | Packaged build | Chạy độc lập ngoài Editor |

## Câu Hỏi Thảo Luận / Discussion Questions

1. GameMode và Spawner nên chia trách nhiệm thế nào?
2. Vì sao wave-clear event cần chống phát nhiều lần?
3. Team Affiliation tốt hơn cast class cụ thể ra sao?
4. Packaged build có thể lộ lỗi nào Editor không lộ?
5. Definition of Done khác “chạy trên máy tôi” thế nào?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Enemy bị destroy không tự động bảo đảm counter wave đúng.
- Restart level không sửa các static/global state thiết kế sai.
- Thành công trong PIE không chứng minh asset/module đã được package đầy đủ.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Game loop | Hoàn chỉnh, state an toàn | Lỗi nhỏ | Chơi được một vòng | Có blocker |
| Spawner/AI | Data-driven, affiliation đúng | Hoạt động tốt | Wave cơ bản | Spawn lỗi |
| UX/Polish | UI/audio/VFX nhất quán | Polish tốt | UI cơ bản | Thiếu feedback |
| Build/Docs | Build sạch, docs đầy đủ | Thiếu nhỏ | Build chạy | Không package |

## Checklist Cuối Khóa

- [ ] Ba wave gồm boss Terra.
- [ ] Win/Lose/Restart hoạt động.
- [ ] Acceptance Tests đạt.
- [ ] Build chạy ngoài Editor.
- [ ] README, DESIGN, TESTING và video demo hoàn chỉnh.
- [ ] Tag Git `echoes-of-terra-v1.0`.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
