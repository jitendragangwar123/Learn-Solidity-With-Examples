//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Loop{
    uint[] public num1;
    uint[] public num2;
    uint[] public num3;
    //doWhileloop
    function doWhileLoop()public {
        uint x=0;
        do{
            num1.push(x);
            x++;
        }
        while(x!=4);
    }


    //whileloop
    function whileLoop() public{
        uint x1=0;
        while(x1!=5){
            num2.push(x1);
            x1++;
        }
    }
    //forloop
    function forLoop() public{
        for(uint i=0;i<5;i++){
            num3.push(i);
        }
    }
}
