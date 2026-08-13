/** blockchain-dapps-10weeks · Tuần 04 · Bài 20: Cấu trúc chương trình tuần 04. */
const records = [{ id: "demo-1", value: 20 }, { id: "demo-2", value: 30 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("20 - Cấu trúc chương trình tuần 04", result);
