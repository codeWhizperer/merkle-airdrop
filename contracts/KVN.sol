pragma solidity ^0.8.4;




import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//                   0xc47b458e84f72d61eb4ab3f1fcc025f3cd2a00cc80aa6c6efa1dbdef03ae6899
//  0xc47b458e84f72d61eb4ab3f1fcc025f3cd2a00cc80aa6c6efa1dbdef03ae6899

contract KVN is ERC20 {
    constructor(uint256 _totalSupply) ERC20("KELVIN", "KVN") {
        _mint(msg.sender, (_totalSupply*10**18));
    }
}