import {ethers} from "hardhat";
async function main() {
 const Contract = await ethers.getContractFactory("MerkleAirdropFacet")
 const claim = await Contract.deploy()
 await claim.deployed()

console.log(claim.address)
 
 
 const receipt = await claim.claim( [],"0x5CC7CB361fcB1327DD626406634c959fFBEd2856",0,"1000000000000000000000");

 console.log(receipt);

  }
  
  // We recommend this pattern to be able to use async/await everywhere
  // and properly handle errors.
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });