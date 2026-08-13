// Tuần 9: Kiểm thử và bảo mật
// Chạy: node code/week09.js
export function withGuard(state, action) {
  if (state.locked) throw new Error("reentrancy bi chan");
  state.locked = true;
  try { return action(); } finally { state.locked = false; }
}
const state = { locked: false };
console.log(withGuard(state, () => "rut tien thanh cong"));
