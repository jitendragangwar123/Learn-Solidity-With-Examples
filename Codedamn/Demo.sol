//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Demo {
    int x;
    constructor(){
        x=10;
    }
    function getter() public view returns(int){
        return x;
    }
    function increment() public {
        x=x+2;
    }
}
