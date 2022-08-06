//ExternalModifiers.sol File

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Contract One
contract One{
    //External Modifier 
    function ExternalOneFunc() external pure returns(string memory){
        return "External One Function";
    }
}

//ExternalModifiers1.sol
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ExternalModifiers.sol";
//Contract Two
contract Two{
    //Deplyed contract One address
    One contractAddr=One(0x14A919590E83B987aF5f7A3273Db70076A794CD0);
    function callExternal() public view returns(string memory){
        return contractAddr.ExternalOneFunc();
    }
}
