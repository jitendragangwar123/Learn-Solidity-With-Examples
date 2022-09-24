// SPDX-License-Identifier: UNLICENSED
/*
Whitelisting addresses for Sell Tax 
*/

pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HyperOneToken is ERC20, Ownable {

    event Whitelisted(address indexed user);

    event Blacklisted(address indexed userAddress);

    mapping(address => bool) blacklistedAddresses;

    constructor(address accountHolder) ERC20("HYPERONE TOKEN", "HOT") {
        _mint(accountHolder, 1000000 * 10 ** decimals());
    }

     function burn(uint256 amount) external onlyOwner {
        _burn(msg.sender, amount);
    }    

    function mint(uint256 amount) external onlyOwner {
        _mint(msg.sender, amount);
    }

    function removeFromBlacklist(address account) external onlyOwner {
        require(blacklistedAddresses[account], "Address already blacklisted");
        blacklistedAddresses[account] = false;
        emit Whitelisted(account);
    }
    
    function addInBlacklist(address account) external onlyOwner {
        require(!blacklistedAddresses[account], "Address blacklisted");
        blacklistedAddresses[account] = true ;
        emit Blacklisted(account);
    }

    function _transfer(
            address from,
            address to,
            uint256 amount
        ) internal override virtual {
            require(!blacklistedAddresses[from] && !blacklistedAddresses[to], "ERC20: Sender/Receiver doesn't have transfer role");
            super._transfer(from, to, amount);
    }
}


