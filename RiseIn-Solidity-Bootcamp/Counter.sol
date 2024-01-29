// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Example {
    address owner;
    // create the structure
    struct Counter {
        uint number;
        string description;
    }
    
    // create the instance for structure
    Counter counter;
    
    // intialize the modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }
    
    // create the constructor and initalize the values
    constructor(uint initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }
    
    // incement the counter
    function increment_counter() external onlyOwner {
        counter.number += 1;
    }
    
    // decrement the counter
    function decrement_counter() external onlyOwner {
        counter.number -= 1;
    }
    
    // get the current counter value
    function get_counter_value() external view returns(uint) {
        return counter.number;
    }
}
