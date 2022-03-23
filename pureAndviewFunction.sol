//SPDX-Licence-Identifier:MIT
pragma solidity ^0.8.7;
///@author Jitendra Kumar
contract MyContract{
    uint public num;
    function viewFun() external view returns(uint){
        return num;
    }
    function pureFun() external pure returns(uint){
        return 1;
    }
    function addToNum(uint x) external view returns(uint){
        return num+x;
    }
    function add(uint x,uint y) external pure returns(uint){
        return x+y;
    }
}