// Tuần 8: ERC-721 NFT
// Chạy: node code/week08.js
export function mintNft(owners, tokenId, owner) {
  if (!owner || Object.hasOwn(owners, tokenId)) throw new Error("tokenId khong hop le");
  return { ...owners, [tokenId]: owner };
}
console.log(mintNft({}, "nft-001", "alice"));
