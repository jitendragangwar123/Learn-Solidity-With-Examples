pragma solidity ^0.6.0;

contract OnlineTicketReservation{

    //enum used for tracking the ticket is Reserved or Available
    enum Statuses{Reserved,Available}
    Statuses currStatus;
    
    //event stores the arguments passed in transaction logs
    event Reserve(address _passenger,uint _val);

    //payable means the owner can recieve the ethereum during transaction
    address payable public owner;

    constructor() public{
        owner=msg.sender;
        currStatus=Statuses.Available;
    }
    //modifier used to check the status of reservation
    modifier onlyWhileAvailable{
        require(currStatus==Statuses.Available,"Seat currently reserved,try next time");
        _;
    } 
    //modifier used to check the required amount
    modifier costs(uint _amount){
        require(msg.value>=_amount,"Amount is not enough.Please provide enough Ether.");
        _;
    }
     //recieve is a special function 
    receive() external payable onlyWhileAvailable costs(3 ether){
        currStatus=Statuses.Reserved;
        owner.transfer(msg.value);
        //emit the event
        emit Reserve(msg.sender,msg.value);
    }
}



