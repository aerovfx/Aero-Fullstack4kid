// Tuần 5: Lỗi và gas
// Chạy: node code/week05.js
export function transfer(balances, from, to, amount) {
  if (amount <= 0 || (balances[from] ?? 0) < amount) throw new Error("so du khong du");
  return { ...balances, [from]: balances[from] - amount, [to]: (balances[to] ?? 0) + amount };
}
console.log(transfer({ alice: 10, bob: 0 }, "alice", "bob", 3));
