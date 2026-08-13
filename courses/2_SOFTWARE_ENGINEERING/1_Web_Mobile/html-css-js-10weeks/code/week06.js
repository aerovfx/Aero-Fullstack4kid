// Tuần 6: nền tảng JavaScript được chắt lọc từ raw_materials/JS.
"use strict";
const tasks = [{ id: 1, title: "Học DOM", done: false }, { id: 2, title: "Viết kiểm thử", done: true }];
function openTaskTitles(items) {
  if (!Array.isArray(items)) throw new TypeError("items phải là mảng");
  return items.filter(({ done }) => !done).map(({ title }) => title.trim());
}
console.log(openTaskTitles(tasks));
