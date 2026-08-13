/** blockchain-dapps-10weeks · Tuần 01 · Bài 10: Code Mẫu / Code Samples. */
const records = [{ id: "demo-1", value: 10 }, { id: "demo-2", value: 20 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("10 - Code Mẫu / Code Samples", result);
