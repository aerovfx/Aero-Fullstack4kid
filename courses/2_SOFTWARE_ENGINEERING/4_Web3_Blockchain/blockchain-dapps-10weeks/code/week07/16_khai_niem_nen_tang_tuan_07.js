/** blockchain-dapps-10weeks · Tuần 07 · Bài 16: Khái niệm nền tảng tuần 07. */
const records = [{ id: "demo-1", value: 16 }, { id: "demo-2", value: 26 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("16 - Khái niệm nền tảng tuần 07", result);
