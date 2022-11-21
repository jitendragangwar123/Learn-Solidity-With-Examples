// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
contract FunctionModifiers{
    string public name="Jay";
    address owner;
    constructor(){
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require(owner==msg.sender,"You are not authorized person!!!");
        _;
    }
    function changeName(string memory _newName) public onlyOwner{
        name=_newName;
    }
}
