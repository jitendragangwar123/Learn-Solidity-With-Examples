// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract day6 {
    function average(int a,int b,int c) public pure returns(int){
      require(a>0 && b>0 && c>0);
      return (a+b+c)/3;   
}
}
