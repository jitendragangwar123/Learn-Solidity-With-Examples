// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Sample  {
    address[] members;
    //to check the membership of the club
    mapping(address=>bool) public is_member;

    function join() public payable{
        //send 1 eth to join the membership
        require(msg.value == 1 ether);
        // add the new member in the list 
        members.push(msg.sender);
        is_member[msg.sender]=true;
    }

    function join_referrer(address payable _referrer) public payable{
        //send 1 eth to join the membership
        require(msg.value == 1 ether);
        //to check the referrer is the member of club or not
        require(is_member[_referrer]==true,"Referrer is not the member");
        //transfer the 10% commision to the referrer after joining the new member 
        _referrer.transfer(0.1 ether);
        //add the new member in the list 
        members.push(msg.sender);
        is_member[msg.sender]=true;
    }

    function get_members() public view returns(address[] memory){
        //return the member addresses list 
        return members;
    }
}
