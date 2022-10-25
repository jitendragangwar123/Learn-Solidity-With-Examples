// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract StateVar {
   // declre the state variable rollNumber
   //Bydefault state variable value depend on datatype 
    int public rollNumber; 
    //initialize the value by using constructor
    constructor(){
        rollNumber=10;
    }

}
