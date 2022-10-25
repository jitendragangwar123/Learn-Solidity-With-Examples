//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

//Constant variables declared as file level
uint constant num=123;

contract CodiesAlert{
    string public constant name="Jay";
    uint public immutable pincode;
    //Immutable variable declared in the constructor but Constant variable is not.
    constructor(){
        pincode=12345;
    }
}
