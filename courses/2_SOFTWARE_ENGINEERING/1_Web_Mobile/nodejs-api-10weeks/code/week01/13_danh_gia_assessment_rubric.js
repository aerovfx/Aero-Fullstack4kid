/** nodejs-api-10weeks · Tuần 01 · Bài 13: Đánh Giá / Assessment Rubric. */
const records = [{ id: "demo-1", value: 13 }, { id: "demo-2", value: 23 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("13 - Đánh Giá / Assessment Rubric", result);
