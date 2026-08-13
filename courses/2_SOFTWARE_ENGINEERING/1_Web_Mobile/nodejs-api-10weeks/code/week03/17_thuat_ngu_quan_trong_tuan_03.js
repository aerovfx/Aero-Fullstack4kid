/** nodejs-api-10weeks · Tuần 03 · Bài 17: Thuật ngữ quan trọng tuần 03. */
const records = [{ id: "demo-1", value: 17 }, { id: "demo-2", value: 27 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("17 - Thuật ngữ quan trọng tuần 03", result);
