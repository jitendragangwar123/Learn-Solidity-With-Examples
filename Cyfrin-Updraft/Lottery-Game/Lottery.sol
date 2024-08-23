// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title A sample Raffle contract
 * @author Jay Gangwar
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2
 */

contract Lottery {
    //custom error
    error Lottery_NotEnoughEthSent();

    uint256 private immutable i_entranceFee;
    //@dev duration of the lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    //events
    event EnterRaffle(address indexed player);
    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp=block.timestamp;
    }

    //function to enter the game
    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Lottery_NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnterRaffle(msg.sender);
    }

   //function to pick the winner
    function pickWinner() external {
        if((block.timestamp-s_lastTimeStamp) < i_interval){
            revert();
        }
    }

   //function to get entrance fee
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
