





pragma solidity 0.8.4;




import "@openzeppelin/contracts/token/ERC20/ERC20.sol";




contract KVN is ERC20 {
    constructor(uint256 _totalSupply) ERC20("KELVIN", "KVN") {
        _mint(msg.sender, (_totalSupply*10**18));
    }
}