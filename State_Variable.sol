//SPDX-Licence-Identifier:MIT
pragma solidity ^0.8.7;
///@author Jitendra Kumar
contract MyContract{
    //State Variable
    uint public myUint;
    function foo(uint _myUint) external pure returns(uint){
        return _myUint;
    }
}