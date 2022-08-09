//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CryptoToken{
    address public minter;
    constructor(){
        minter=msg.sender;
    }
    mapping(address=>uint) public balances;
    //Create the event for sending the token from one account to another account
    event Sent(address from, address to,uint amount);
    //Create the function for mint the tokens
    function mint(address owner,uint amount) public{
        balances[owner]+=amount;
        require(msg.sender==minter);
    }
    //Create the function for send the token from sender to receiver
    function send(address reciever,uint amount) public{
        //decrease the token from the sender address
        balances[msg.sender]-=amount;
        //add the token to the receiver address
        balances[reciever]+=amount;
        //emit the sent event 
        emit Sent(msg.sender,reciever,amount);
    }
}
