//Interface.sol

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract InterfaceEx{
    string Name;
    function setName(string memory _name) public{
        Name=_name;
    }
    function getName()public view returns(string memory){
        return Name;
    }
}

Interact.sol

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//declare interface here name is ICA 
interface ICA{
    //function definitions 
    function setName(string memory _name) external;
    function getName()external view returns(string memory);
}

contract Access{
    //call the setName() function by using the deployed address and interface name 
    function callSetName() public {
        ICA(0x68d9d97731C68b8857D48D4edBb0a41AF211194A).setName("Jay");
    }
    //call the getName() function by using the deployed address and interface name 
    function callGetName() public view returns(string memory){
        return ICA(0x68d9d97731C68b8857D48D4edBb0a41AF211194A).getName();
    }
}
