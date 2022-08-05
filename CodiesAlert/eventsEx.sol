//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract eventsEx{
    address sender;
    string name;

    //create a event 
    //indexed keyword used for filtering the data and return the has value of the variable
    event userDetails(address indexed _sender,string _name);

    function emitEvent(address _sender,string memory _name) public {
        //emit the event 
        emit userDetails(_sender,_name);
    }
}

// events Data stored into the LOG upcode which takes 375 gas value + 375 (for the indexed variable)
// state variable stored the data into SSTORE which takes 20,000 gas value 
