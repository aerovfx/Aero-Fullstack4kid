// Tuần 10: Tích hợp DApp
// Chạy: node code/week10.js
export function transactionStatus(receipt) {
  if (!receipt) return { state: "pending", message: "Dang cho xac nhan" };
  if (receipt.status === 1) return { state: "success", message: `Da xac nhan tai block ${receipt.blockNumber}` };
  return { state: "failed", message: receipt.reason ?? "Giao dich that bai" };
}
console.log(transactionStatus({ status: 1, blockNumber: 123 }));
