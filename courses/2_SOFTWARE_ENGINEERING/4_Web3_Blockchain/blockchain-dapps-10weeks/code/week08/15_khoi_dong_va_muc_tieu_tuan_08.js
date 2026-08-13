/** blockchain-dapps-10weeks · Tuần 08 · Bài 15: Khởi động và mục tiêu tuần 08. */
const records = [{ id: "demo-1", value: 15 }, { id: "demo-2", value: 25 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("15 - Khởi động và mục tiêu tuần 08", result);
