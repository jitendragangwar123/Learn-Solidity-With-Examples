// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Day6 {
    function reverseDigit(uint256 n) public pure returns(uint256){
      uint256 rev=0;
      uint256  rem;
      while(n!=0){
        rem=n%10;
        rev=rev*10+rem;
        n=n/10;
      }
      return rev;
    }
}
