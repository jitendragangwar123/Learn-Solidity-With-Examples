// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Sample  {
    function compare(string memory _str1,string memory _str2) public pure returns(bool){
        if(keccak256(abi.encodePacked(_str1))==keccak256(abi.encodePacked(_str2))){
            return true;
        }
        else{
            return false;
        }
    }
