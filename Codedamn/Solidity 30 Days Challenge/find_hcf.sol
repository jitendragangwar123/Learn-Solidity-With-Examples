// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Day3 {
    function hcf(uint256 n1,uint n2)public pure returns(uint256){
        if(n2!=0){
            return hcf(n2,n1%n2);
        }
        else{
            return n1;
        }
    }                
    
}
