/** blockchain-dapps-10weeks · Tuần 05 · Bài 19: Dữ liệu đầu vào tuần 05. */
const records = [{ id: "demo-1", value: 19 }, { id: "demo-2", value: 29 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("19 - Dữ liệu đầu vào tuần 05", result);
