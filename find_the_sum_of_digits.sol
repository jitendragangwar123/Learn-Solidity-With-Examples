// SPDX-License-Identifier: aIT
pragma solidity >=0.5.0 <0.9.0;

contract day1 {
    function digitSum(int256 n) public pure returns (int256){
        int256 rem;
        int256 sum=0;
        require(n>0);
        while(n>0){
        rem=n%10;
        sum=sum+rem;
        n=n/10;
        }  
        return sum; 
    }
}
