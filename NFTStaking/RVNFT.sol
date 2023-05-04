// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
/// @title A contract for ERC721 token 
/// @author Jitendra Kumar
/// @notice For now, this contract just show how to Implement ERC721 token

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RVNFT is ERC721, Ownable {
    uint256 public totalSupply;
    constructor() ERC721("RVNFT", "RVNFT") {}
    
    //Everyone can mint the NFT 
    function safeMint(address to) public{
        totalSupply++;
        _safeMint(to, totalSupply);
    }
}
