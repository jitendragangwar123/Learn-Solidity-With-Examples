// SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // store the contract addresses 
    SimpleStorage[] public listOfSimpleStorageContracts;
    // create the smart contract
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
    // add new person details
    function sfAddPerson(
        uint256 _simpleStorageIndex,
        uint256 _newNumber,
        string memory _newName
    ) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].addPerson(
            _newNumber,
            _newName
        );
    }
    // get person details 
    function getPersonDetails(uint256 _simpleStorageIndex)
        public
        view
        returns (SimpleStorage.Person[] memory)
    {
        return
            listOfSimpleStorageContracts[_simpleStorageIndex]
                .retrievePeopleDetails();
    }
}
