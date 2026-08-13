/** blockchain-dapps-10weeks · Tuần 07 · Bài 03: Lý Thuyết / Theory. */
const records = [{ id: "demo-1", value: 3 }, { id: "demo-2", value: 13 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("03 - Lý Thuyết / Theory", result);
