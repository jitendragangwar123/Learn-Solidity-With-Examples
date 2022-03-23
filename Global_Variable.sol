//SPDX-Licence-Identifier:MIT
pragma solidity ^0.8.7;
///@author Jitendra Kumar
contract MyContract{
    function globalVars() external view returns(address,uint,uint){
        address sender=msg.sender;
        uint timestamp=block.timestamp;
        uint blockNum=block.number;
        return (sender,timestamp,blockNum);
    }

}