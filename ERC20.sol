// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    address public admin;
    constructor() ERC20("My Token","MTK"){
        _mint(msg.sender,1000*10**18);
        admin=msg.sender;
    }
    function mint(address to,uint amount) external{
        require(msg.sender==admin,"Only Owner");
        _mint(to,amount);
    }
//burn the token
    function burn(uint amount) external{
         _burn(msg.sender,amount);
    }
}
