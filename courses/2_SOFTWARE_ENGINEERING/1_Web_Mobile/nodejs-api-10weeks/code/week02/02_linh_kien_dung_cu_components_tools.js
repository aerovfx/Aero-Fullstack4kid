/** nodejs-api-10weeks · Tuần 02 · Bài 02: Linh Kiện & Dụng Cụ / Components & Tools. */
const records = [{ id: "demo-1", value: 2 }, { id: "demo-2", value: 12 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("02 - Linh Kiện & Dụng Cụ / Components & Tools", result);
