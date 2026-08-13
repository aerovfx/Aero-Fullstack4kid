/** nodejs-api-10weeks · Tuần 07 · Bài 09: Nhiệm vụ thực tế / Task. */
const records = [{ id: "demo-1", value: 9 }, { id: "demo-2", value: 19 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("09 - Nhiệm vụ thực tế / Task", result);
