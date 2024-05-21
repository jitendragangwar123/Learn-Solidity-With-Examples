//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

//custom error
error NotOwner();

contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD = 5e18;
    address public immutable i_owner;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    constructor() {
        i_owner = msg.sender;
    }

    modifier onlyOwner() {
        //require(msg.sender==i_owner,"Sender is not owner!");
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "did not send enough eth"
        ); //1e18=1ETH

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        for (uint256 i = 0; i < funders.length; i++) {
            addressToAmountFunded[funders[i]] = 0;
        }
        //reset the funders array
        funders = new address[](0);

        //transfer
        // payable(msg.sender).transfer(address(this).balance);

        //send
        // bool success=payable(msg.sender).send(address(this).balance);
        // require(success,"send failed");

        //call
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success, "call failed");
    }

    // send ether without calling the fund function
    //msg.data is not available
    receive() external payable {
        fund();
    }
    //msg.data is available
    fallback() external payable {
        fund();
    }
}
