# Tuần 7: Data structure thực tế và trait nâng cao

## Nguồn

Chương 11, 12: HashMap/HashSet, max stack, BST, trie, LRU, trait bound, associated type, supertrait, marker trait và static/dynamic dispatch.

## Mục tiêu

- Chọn data structure dựa trên access pattern và complexity.
- Thiết kế trait có associated type rõ ràng.
- So sánh generic static dispatch với `dyn Trait` dynamic dispatch.

```rust
trait Ranker {
    type Item;
    fn score(&self, item: &Self::Item) -> i64;
}

fn best<'a, R: Ranker>(ranker: &R, items: &'a [R::Item]) -> Option<&'a R::Item> {
    items.iter().max_by_key(|item| ranker.score(item))
}
```

## Lab

Chọn một bài toán: top products, autocomplete bằng trie hoặc LRU cache. Ghi complexity của operation chính, test duplicate/empty/capacity edge case và giải thích lựa chọn structure.

## Lưu ý

Không tự xây cấu trúc phức tạp trong production chỉ để “tối ưu”; ưu tiên crate/library đã review nếu đáp ứng yêu cầu.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 07](../code/week07/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 07](../code/week07/README.md), học lần lượt từ `01_...` đến `20_...`.
