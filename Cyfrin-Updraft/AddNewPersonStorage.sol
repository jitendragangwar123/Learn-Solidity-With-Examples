// SPDX-License-Identifier:MIT
pragma solidity 0.8.18;

import "./SimpleStorage.sol";

contract AddNewPersonStorage is SimpleStorage {
    function addPerson(uint _number,string memory _name) public override {
        listOfPeople.push(Person(_number, _name));
        nameTofavoriteNumber[_name]=_number;
    }
}
