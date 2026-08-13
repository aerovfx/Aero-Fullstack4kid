/** blockchain-dapps-10weeks · Tuần 01 · Bài 17: Thuật ngữ quan trọng tuần 01. */
const records = [{ id: "demo-1", value: 17 }, { id: "demo-2", value: 27 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("17 - Thuật ngữ quan trọng tuần 01", result);
