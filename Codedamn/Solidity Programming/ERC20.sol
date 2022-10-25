// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    constructor(address creator) ERC20("META", "3DM") {
        _mint(creator, 340000000 * 10 ** decimals());
    }
    
   function decimals() public view virtual override returns (uint8) {
        return 9;
    }
}
