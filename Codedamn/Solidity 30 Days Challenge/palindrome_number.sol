// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Day5 {
    function  palindrome(uint256 n)public pure returns(uint256){
        uint256 original=n;
        uint256 rem;
        uint256 rev=0;
        while(n!=0){
            rem=n%10;
            rev=rev*10+rem;
            n=n/10;
        }
        if(original==rev){
            return 1;
        }
        else{
            return 0;
        }
    } 
    
}
