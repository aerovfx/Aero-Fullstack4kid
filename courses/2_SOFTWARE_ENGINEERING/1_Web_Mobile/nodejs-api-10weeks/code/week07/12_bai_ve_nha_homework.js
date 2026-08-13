/** nodejs-api-10weeks · Tuần 07 · Bài 12: Bài Về Nhà / Homework. */
const records = [{ id: "demo-1", value: 12 }, { id: "demo-2", value: 22 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("12 - Bài Về Nhà / Homework", result);
