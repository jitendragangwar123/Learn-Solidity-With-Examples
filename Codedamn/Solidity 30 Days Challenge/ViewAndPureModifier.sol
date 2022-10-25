//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
    uint num=123;

    //pure modifier
    function addNum(uint _a,uint _b)public pure returns(uint){
        return (_a + _b);
    }

    //view modifier
    function getNum() public view returns(uint){
        return num;
    }

}
