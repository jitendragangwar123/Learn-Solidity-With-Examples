//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5e18;

    function fund() public payable {
        require(
            getConversionRate(msg.value) >= minimumUsd,
            "didn't send enough eth"
        ); //1e18=1ETH
    }

    // ETH/USD = 0x694AA1769357215DE4FAC081bf1f309aDC325306 (seploia)
    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();
        //3000_00000000
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount)
        public
        view
        returns (uint256)
    {
        uint256 ethPrice = getPrice();
        // (3000_000000000000000000 * 1_000000000000000000) / 1e18
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
