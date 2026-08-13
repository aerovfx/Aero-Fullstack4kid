/** nodejs-api-10weeks · Tuần 04 · Bài 11: Câu Hỏi Thảo Luận / Discussion. */
const records = [{ id: "demo-1", value: 11 }, { id: "demo-2", value: 21 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("11 - Câu Hỏi Thảo Luận / Discussion", result);
