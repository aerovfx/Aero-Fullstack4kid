/** nodejs-api-10weeks · Tuần 03 · Bài 04: Giới thiệu tổng quan về Express.js Router & API Routing (Overview). */
const records = [{ id: "demo-1", value: 4 }, { id: "demo-2", value: 14 }];
const result = records.map((item) => ({ ...item, active: item.value >= 10 }));
console.log("04 - Giới thiệu tổng quan về Express.js Router & API Routing (Overview)", result);
