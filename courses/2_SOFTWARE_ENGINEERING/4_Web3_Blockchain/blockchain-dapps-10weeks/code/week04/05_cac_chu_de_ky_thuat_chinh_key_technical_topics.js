/** blockchain-dapps-10weeks · Tuần 04 · Bài 05: Các chủ đề kỹ thuật chính (Key Technical Topics). */
const records = [{ id: "demo-1", value: 5 }, { id: "demo-2", value: 15 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("05 - Các chủ đề kỹ thuật chính (Key Technical Topics)", result);
