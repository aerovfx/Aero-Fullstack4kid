/** blockchain-dapps-10weeks · Tuần 03 · Bài 01: Mục Tiêu / Objectives. */
const records = [{ id: "demo-1", value: 1 }, { id: "demo-2", value: 11 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("01 - Mục Tiêu / Objectives", result);
