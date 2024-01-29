//SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

contract Escrow {
    address public payer;
    address payable public payee;
    address public thirdParty;
    uint256 public amount;

    constructor(
        address _payer,
        address payable _payee,
        uint256 _amount
    ) {
        payer = _payer;
        payee = _payee;
        thirdParty = msg.sender;
        amount = _amount;
    }

    function deposit() public payable {
        require(msg.sender == payer, "Sender must be the payer.");
        require(
            address(this).balance <= amount,
            "Can not send more than escrow amount."
        );
    }

    function release() public {
        require(
            address(this).balance == amount,
            "Can not release funds before full amount is sent."
        );
        require(payee == thirdParty, "Only thirdParty can release funds.");
        payee.transfer(amount);
    }

    function balanceOf() public view returns (uint256) {
        return address(this).balance;
    }
}


/*
1.Should deposit fund.
2.Should not deposit if transfer exceed total escrow amount.
3.Should not deposit if not sending from payer.
4.Should not release if full amount not received.
5.Should not release if not thirdParty.
*/
