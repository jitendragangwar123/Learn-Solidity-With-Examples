// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CheckEtherUnits {

    uint public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;
    uint public oneGWei = 1 gwei;
    // 1 gwai is equal to 10^9 wei
    bool public isOneGWei= 1 gwei== 1e9;
    uint public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;
}




// assert(1 wei == 1);
// assert(1 gwei == 1e9);
// assert(1 ether == 1e18);
