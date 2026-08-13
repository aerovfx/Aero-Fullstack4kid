/** nodejs-api-10weeks · Tuần 10 · Bài 07: Thực Hành / Hands-On. */
const records = [{ id: "demo-1", value: 7 }, { id: "demo-2", value: 17 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("07 - Thực Hành / Hands-On", result);
