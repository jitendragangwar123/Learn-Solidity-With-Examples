//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Contract One
contract One{
    //Make function virtual 
    function OneFunc() public virtual pure returns(string memory){
        return "One Function";
    }
}
//Inherite the Contract One into Two and Override the function OneFunc()
contract Two is One{
    function OneFunc() public virtual override pure returns(string memory){
        return "Two Function";
    }
    
    //Access the OneFunc() inside the Contract Two by using super keyword
    function accessContractOne() public pure returns(string memory){
        return super.OneFunc();
    }
}

//Inherite the Contract Two into Three and Override the function OneFunc()
contract Three is Two{
    function OneFunc() public override pure returns(string memory){
        return "Three Function";
    }
}

