/*
 - transfer
    payable(msg.sender).transfer(address(this).balance);
 - send
    bool success=payable(msg.sender).send(address(this).balance);
    require(success,"send failed");
 - call
    (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(success, "call failed");

 - send ether without calling the fund function
   1. msg.data is not available
    receive() external payable {
        fund();
    }

   2. msg.data is available
    fallback() external payable {
        fund();
    }
*/

/*
Functions Order:
 1.constructor
 2.receive
 3.fallback
 4.external
 5.public
 6.internal
 7.private
 8.view / pure
*/

//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

error FundMe__NotOwner();
contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD = 5e18;
    address public immutable i_owner;

    address[] public funders;
    AggregatorV3Interface private s_priceFeed;
    mapping(address => uint256) public addressToAmountFunded;
    // events 

    // modifier
    modifier onlyOwner() {
        if (msg.sender != i_owner) {
            revert FundMe__NotOwner();
        }
        _;
    }

    //constructor
    constructor(address pricefeed) {
        i_owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(pricefeed);
    }

    //receive
    receive() external payable {
        fund();
    }

    //fallback
    fallback() external payable {
        fund();
    }
    // public function
    function fund() public payable {
        require(
            msg.value.getConversionRate(s_priceFeed) >= MINIMUM_USD,
            "did not send enough ether"
        );

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }
    // public function
    function withdraw() public onlyOwner {
        for (uint256 i = 0; i < funders.length; i++) {
            addressToAmountFunded[funders[i]] = 0;
        }

        funders = new address[](0);
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success, "call failed");
    }
    // internal function

    // private function

    // view function
    function getVersion() public view returns (uint256) {
        return s_priceFeed.version();
    }
}
