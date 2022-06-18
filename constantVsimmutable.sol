//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

//constact variables declared as file level
uint constant num=123;

contract Codiesalert{
    string public constant name="jay";
    uint public immutable pincode;
    //immutable variable declared in the constructor but constant variable is not.
    constructor(){
        pincode=12345;
    }
}
