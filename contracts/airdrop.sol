// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
contract MerkleAirdropFacet {
    address deploymentAddress =0x19638E0FCD5c01C2a17302AADECB849950D2b798;
    bytes32 root = 0xc47b458e84f72d61eb4ab3f1fcc025f3cd2a00cc80aa6c6efa1dbdef03ae6899;
     IERC20 deployedContract = IERC20(deploymentAddress);
// 0xb956e0Bc6Bf85d1777b281c4a74b375005bb1f48
    event AddressClaim( address account, uint256 itemId, uint256 amount);
        function claim(
            uint256 _itemId,
            uint256 _amount,
            bytes32[] calldata _merkleProof
        ) external{
        bytes32 node =  keccak256(abi.encodePacked(msg.sender, _itemId, _amount));
        bytes32 merkleRoot = root;
        require(MerkleProof.verify(_merkleProof, merkleRoot, node), "MerkleDistributor: Invalid proof.");
            deployedContract.transferFrom(address(this), msg.sender,  _amount);
        emit AddressClaim( msg.sender, _itemId, _amount);
        }

}
