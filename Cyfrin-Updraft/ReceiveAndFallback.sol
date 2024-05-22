//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract ReceiveAndFallback {
    uint256 public amount;

    //msg.data is empty
    receive() external payable {
        amount = 1;
    }

    //msg.data is not empty
    fallback() external payable {
        amount = 2;
    }
}
