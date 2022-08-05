//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract PayableFun{
    address payable reciever=payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    //payable function gets ether when it calls in the smart contract
    function cellPhone() public payable returns(uint){
        return address(this).balance;
    }
    
    //transfer function used to send the ether to reciever address, but currently we have not used 
    //this function in solidity.
    function sendEther() public{
        reciever.transfer(5 ether);
    }
}
