// Tuần 7: ERC-20
// Chạy: node code/week07.js
export function transferToken(state, from, to, amount) {
  if (!to || amount <= 0 || (state.balances[from] ?? 0) < amount) throw new Error("transfer that bai");
  const balances = { ...state.balances, [from]: state.balances[from] - amount, [to]: (state.balances[to] ?? 0) + amount };
  return { ...state, balances, events: [...state.events, { type: "Transfer", from, to, amount }] };
}
console.log(transferToken({ totalSupply: 100, balances: { alice: 100 }, events: [] }, "alice", "bob", 25));
