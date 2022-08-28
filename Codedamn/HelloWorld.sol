//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Strings {
    string res="HelloWorld";
    function hello() public view returns(string memory){
        return res;
    }
}
