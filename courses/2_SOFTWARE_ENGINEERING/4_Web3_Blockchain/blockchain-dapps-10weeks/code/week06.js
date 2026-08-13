// Tuần 6: Kế thừa và thư viện
// Chạy: node code/week06.js
export function feeOf(amount, bps) {
  if (!Number.isSafeInteger(amount) || !Number.isInteger(bps)) throw new Error("chi dung so nguyen");
  return Math.floor(amount * bps / 10_000);
}
console.log({ phi: feeOf(100_000, 30) });
