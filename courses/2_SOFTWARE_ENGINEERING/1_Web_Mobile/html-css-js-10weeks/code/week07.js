// Tuần 7: object, class, spread, destructuring và optional chaining.
"use strict";
class TaskStore {
  #tasks = [];
  add({ id, title, metadata = {} }) {
    if (!Number.isInteger(id) || !title?.trim()) throw new Error("Task không hợp lệ");
    if (this.#tasks.some((task) => task.id === id)) throw new Error("ID đã tồn tại");
    this.#tasks = [...this.#tasks, { id, title: title.trim(), tag: metadata?.tag ?? "general" }];
  }
  list() { return this.#tasks.map(({ id, title, tag }) => ({ id, title, tag })); }
}
const store = new TaskStore();
store.add({ id: 1, title: "  Học destructuring  ", metadata: { tag: "javascript" } });
console.log(store.list());
