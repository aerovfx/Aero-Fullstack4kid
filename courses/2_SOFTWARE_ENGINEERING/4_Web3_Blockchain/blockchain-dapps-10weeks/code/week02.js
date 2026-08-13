// Tuần 2: Solidity và trạng thái hợp đồng
// Chạy: node code/week02.js
export function increment(state, amount) {
  if (!Number.isSafeInteger(amount) || amount < 0) throw new Error("amount khong hop le");
  return { ...state, count: state.count + amount };
}
console.log(increment({ count: 1 }, 2));
