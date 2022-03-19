// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MerkleAirdropFacet is ERC20 {
  
    bytes32 merkleRoot = 0x2fc26c3ba0f0570a72b3b4e4b7a7af3ffa970d2305ae8141c721844b5204e4bc;
    

    constructor() ERC20("MELVIN", "MVN") {}

    mapping(address => bool) hasClaimed;
    event AddressClaim(address account, uint256 itemId, uint256 amount);

    function claim(
        bytes32[] calldata _merkleProof,
        address claimer,
        uint256 _itemId,
        uint256 _amount
    ) external {
        require(!hasClaimed[claimer], "You have already claimed!");
        bytes32 node = keccak256(
            abi.encodePacked(claimer, _itemId, _amount)
        );
        require(
            MerkleProof.verify(_merkleProof, merkleRoot, node),
            "MerkleDistributor: Invalid proof."
        );
        _mint(claimer, _amount * 10**18);
        hasClaimed[claimer] = true;
        emit AddressClaim(claimer, _itemId, _amount);
    }
}
