// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;
contract HashFunction {
    function hash(
        string memory word,
        uint num,
        address addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(word, num, addr));
    }

    // Example of hash collision
    // Hash collision can occur when you pass more than one dynamic data type
    // to abi.encodePacked. In such case, you should use abi.encode instead.
    function collision(string memory _str1, string memory _str2)
        public
        pure
        returns (bytes32)
    {
        // encodePacked(AAA, BBB) -> AAABBB
        // encodePacked(AA, ABBB) -> AAABBB
        return keccak256(abi.encodePacked(_str1, _str2));
    }
}

contract GuessTheMagicWord {
    bytes32 public ans =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == ans;
    }
}
