//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract GasLimit {
    function returngasLimit() public view returns (uint256) {
    /*Type your statement here to get the block gas limit*/
        return block.gaslimit;
    }
}
