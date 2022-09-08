// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract GasPrice {
    function gasPrice() public view returns (uint256) {
    /*Type your statement here in order to get the transaction gas price*/
    //calculate the gasPrice by using tx.gasprice
        return tx.gasprice;
    }
}
