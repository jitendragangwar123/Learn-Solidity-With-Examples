// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract day5 {
    function find(int256 a) public pure returns(int256){
    //it's check the condition
    require(a>0, "a is greater than zero");
    return a%3;
}
}
