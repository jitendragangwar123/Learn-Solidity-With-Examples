// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Sample  {
    address owner;
    uint num;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"Owner is not valid!");
        _;
    }
    function get_owner() public view returns(address){
        return owner;
    }

    function change_owner(address _newOwner) public onlyOwner{
        owner=_newOwner;
    }
    
    function store(uint _num) public onlyOwner{
        num=_num;
    }

    function retrieve() public view returns(uint){
        return num;
    }

}
