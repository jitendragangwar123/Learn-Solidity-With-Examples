pragma solidity ^0.8.7;
//@author Jitendra Kumar
contract MyContract{
    uint public count=0;
    function incrementCount() external{
        count+=1;
    }
    function decrementCount() external{
        count-=1;
    }
    
}

