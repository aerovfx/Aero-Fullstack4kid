/** blockchain-dapps-10weeks · Tuần 02 · Bài 14: code minh họa của tuần. */
const records = [{ id: "demo-1", value: 14 }, { id: "demo-2", value: 24 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("14 - code minh họa của tuần", result);
