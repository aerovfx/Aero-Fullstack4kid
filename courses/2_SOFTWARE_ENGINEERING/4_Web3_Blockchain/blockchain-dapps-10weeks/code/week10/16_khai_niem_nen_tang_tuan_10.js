/** blockchain-dapps-10weeks · Tuần 10 · Bài 16: Khái niệm nền tảng tuần 10. */
const records = [{ id: "demo-1", value: 16 }, { id: "demo-2", value: 26 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("16 - Khái niệm nền tảng tuần 10", result);
