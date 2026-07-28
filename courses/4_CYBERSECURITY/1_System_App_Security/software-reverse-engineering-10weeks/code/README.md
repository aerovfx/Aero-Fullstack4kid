# Code lab

Toàn bộ code trong thư mục này dùng cho binary do khóa học tự tạo hoặc kiểm tra PE tĩnh. Không cần tải crackme/phần mềm bên thứ ba.

## Yêu cầu

- Python 3.10+.
- Một C compiler để build `toy_control_flow.c`.
- Trên Windows: Visual Studio Build Tools (`cl`) hoặc MinGW/Clang được quản lý bởi lớp.

## Build toy program

### MSVC Developer Command Prompt

```powershell
cl /nologo /W4 /WX /Zi /Od toy_control_flow.c /Fe:toy_debug.exe
cl /nologo /W4 /WX /O2 toy_control_flow.c /Fe:toy_release.exe
```

`/Zi /Od` giúp build Debug dễ đối chiếu source; `/O2` minh họa tác động optimization. Không phát hành artifact lab như phần mềm production.

### GCC/Clang

```bash
cc -std=c11 -Wall -Wextra -Werror -g -O0 toy_control_flow.c -o toy_debug
cc -std=c11 -Wall -Wextra -Werror -O2 toy_control_flow.c -o toy_release
```

## Chạy test

```bash
python -m unittest -v test_pe_triage.py test_toy_control_flow.py
```

Test PE tạo file tổng hợp trong temporary directory; test control-flow build binary vào temporary directory và tự dọn sau khi chạy.

## Triage một PE lab

```bash
python pe_triage.py --json path/to/authorized-lab.exe
```

Script không thực thi target. Kết quả metadata vẫn cần được cross-check và không tự chứng minh file an toàn/độc hại.

## Tạo manifest

```bash
python hash_manifest.py create manifest.json artifact-a.exe artifact-b.exe
python hash_manifest.py verify manifest.json
```

Manifest hiện lưu đường dẫn tuyệt đối để phục vụ lab cục bộ. Khi chia sẻ báo cáo, thay đường dẫn cá nhân bằng artifact ID nhưng giữ hash đầy đủ.
