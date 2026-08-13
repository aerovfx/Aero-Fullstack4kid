/** blockchain-dapps-10weeks · Tuần 05 · Bài 06: Sơ Đồ Cấu Hình / Diagram. */
const records = [{ id: "demo-1", value: 6 }, { id: "demo-2", value: 16 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("06 - Sơ Đồ Cấu Hình / Diagram", result);
