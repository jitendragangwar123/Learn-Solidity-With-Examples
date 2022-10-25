//SPDX-Licence-Identifier:MIT
pragma solidity ^0.8.7;
///@author Jitendra Kumar
contract MyContract{
    function IfElseExample(uint _x) public pure returns(uint){
        if(_x<10){
            return 1;
        }
        else if(_x<20){
            return 2;
        }
        return 3;
    }
    //Ternary Operators
    function Ternary(uint _x) public pure returns(uint){
        return _x<10 ? 1:2;
    }
}