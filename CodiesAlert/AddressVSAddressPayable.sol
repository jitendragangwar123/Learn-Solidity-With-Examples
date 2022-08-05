//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract AddressVSAddressPayable{
    address public owner=msg.sender;
    // To need the type-casting for the address payable  
    address payable public reciever=payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    
    function getBal() public returns(uint,uint){
        //reciever account value is always greater than owner account value
        require(owner<reciever,"Reciever is smaller!!");
        owner=msg.sender;
        // balance is the global variable to check the balance 
        return (owner.balance,reciever.balance);
    }
}
