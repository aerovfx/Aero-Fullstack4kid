/** nodejs-api-10weeks · Tuần 09 · Bài 18: Chuẩn bị môi trường tuần 09. */
const records = [{ id: "demo-1", value: 18 }, { id: "demo-2", value: 28 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("18 - Chuẩn bị môi trường tuần 09", result);
