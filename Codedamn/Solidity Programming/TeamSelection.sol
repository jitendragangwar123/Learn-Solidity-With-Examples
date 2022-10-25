//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Team {
    //Size of the team is 16
    address[16] teams;
    //return the team players
    function getTeamPlayers() public view returns(address[16] memory){
       return teams;
    }
    //select jersey number by using playerId 
    function selectJerseyNumber(uint playerId) public returns(uint256){
        require(playerId>=0 && playerId<16);
        teams[playerId]=msg.sender;
        return playerId;
    }
}
