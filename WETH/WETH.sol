// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20{

    //Deposit Event
    event Deposit(address indexed account,uint amount);
    //Withdraw Event
    event Withdraw(address indexed account,uint amount);

    constructor() ERC20("Wrapped Ether","WETH"){}
    
    //fallback() function used for send ether direct to deposit() function
    fallback() external payable {
        deposit();
    }
    // deposit() function used for mint some ether to contract
    function deposit() public payable {
        _mint(msg.sender, msg.value);
        emit Deposit(msg.sender, msg.value);
    }
    
    //withdraw() function used to burn some ether to contract
    function withdraw(uint _amount) external{
        _burn(msg.sender, _amount);
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }
}

//WETH => It is an ERC-20 token. 
        //It facilitate ether exchange for other tokens ERC-20.
        //It called as Wrapped Ether.
