// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Sample {
    function findValue(int[] calldata a,uint ind,uint hrs) public pure returns(int){
       require(ind < a.length, "Index out of range");
       return a[ind]*int(hrs);
		}
 }
