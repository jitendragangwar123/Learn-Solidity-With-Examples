//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract StringConcate{
    function concateTheStrings(string memory _a,string memory _b)public pure returns(string memory){
        return string(abi.encodePacked(_a,' ',_b));
    }
}
