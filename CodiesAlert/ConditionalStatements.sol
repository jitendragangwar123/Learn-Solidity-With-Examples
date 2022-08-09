//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ConditionalSt{
    uint oranges=10;
    function checkCondition() public view returns(bool){
        if(oranges==10){
            return true;
        }
        else{
            return false;
        }
    }

    function addOranges() public view returns(uint){
        if(oranges==10){
            return oranges+1;
        }
        else{
            return oranges-1;
        }
    }
}
    
