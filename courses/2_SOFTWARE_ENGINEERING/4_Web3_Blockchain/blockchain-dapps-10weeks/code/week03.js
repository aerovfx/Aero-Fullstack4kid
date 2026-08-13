// Tuần 3: Kiểu dữ liệu và visibility
// Chạy: node code/week03.js
export function isAddress(value) {
  return typeof value === "string" && /^0x[0-9a-fA-F]{40}$/.test(value);
}
console.log(isAddress("0x" + "ab".repeat(20)));
