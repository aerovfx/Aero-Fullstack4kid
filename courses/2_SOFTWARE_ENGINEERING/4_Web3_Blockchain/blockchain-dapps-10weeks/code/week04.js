// Tuần 4: Array, struct và mapping
// Chạy: node code/week04.js
export function addUser(users, address, name) {
  if (users[address]) throw new Error("dia chi da ton tai");
  return { ...users, [address]: { name, active: true } };
}
console.log(addUser({}, "0xalice", "Alice"));
