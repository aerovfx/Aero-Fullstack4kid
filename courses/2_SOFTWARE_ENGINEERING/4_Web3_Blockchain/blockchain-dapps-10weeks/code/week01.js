// Tuần 1: Chuỗi khối và EVM
// Chạy: node code/week01.js
import { createHash } from "node:crypto";
export function mineBlock(data, previousHash, difficulty = "00") {
  let nonce = 0;
  while (true) {
    const hash = createHash("sha256").update(`${previousHash}|${data}|${nonce}`).digest("hex");
    if (hash.startsWith(difficulty)) return { data, previousHash, nonce, hash };
    nonce++;
  }
}
const genesis = mineBlock("Khoi dau", "0");
const next = mineBlock("Alice gui Bob 2 token", genesis.hash);
console.log({ genesis, next, lienKetHopLe: next.previousHash === genesis.hash });
