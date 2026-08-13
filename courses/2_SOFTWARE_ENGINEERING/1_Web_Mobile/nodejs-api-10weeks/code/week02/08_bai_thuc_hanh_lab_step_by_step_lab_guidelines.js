/** nodejs-api-10weeks · Tuần 02 · Bài 08: Bài Thực Hành Lab (Step-by-Step Lab Guidelines). */
const records = [{ id: "demo-1", value: 8 }, { id: "demo-2", value: 18 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("08 - Bài Thực Hành Lab (Step-by-Step Lab Guidelines)", result);
