// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";

async function main() {

  const wallet = "0x0c0014c341526c52Abf1Cb64F9C764519075E45d";
  // 0x19638E0FCD5c01C2a17302AADECB849950D2b798  disployAddress
const ContractClaim = await ethers.getContractFactory("MerkleAirdropFacet");
const contract = await ContractClaim.deploy();
await contract.deployed();
const addr = contract.address;
console.log(addr)

// 0xb956e0Bc6Bf85d1777b281c4a74b375005bb1f48



}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
