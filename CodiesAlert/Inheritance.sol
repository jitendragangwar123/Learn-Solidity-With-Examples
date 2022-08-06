//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Constroctor One
contract One{
    string public Name;
    //Initialize the constructor 
    constructor(string memory _name){
        Name=_name;
    }

    function OneFunc() public pure returns(string memory){
        return "One Function";
    }
}
//constructor Two
contract Two{
    function TwoFunc() public pure returns(string memory){
        return "Two Function";
    }
}

//Inherite the contract One and Two in contract Three
//Contract one have the constructor so here I have passed the value in constructor
contract Three is One("Jay"),Two{
    //initialize the function 
    function ThreeFunc() public pure returns(string memory){
        return "Three Function";
    }
    //call the function from contract one.
    function callOneFunc() public pure returns(string memory){
        return OneFunc();
    }
    //call the function from contract two
    function callTwoFunc() public pure returns(string memory){
        return TwoFunc();
    }
}



