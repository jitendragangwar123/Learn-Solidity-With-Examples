// SPDX-License-Identifier:MIT
pragma solidity 0.8.18;

contract SimpleStorage {
    // define structure for Person
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    //Person public myFriend = Person({favoriteNumber: 5, name: "Pat"});
    Person[] public listOfPeople;

    // mapping for finding the favorite Number
    mapping(string => uint256) public nameTofavoriteNumber;

    // function to add the new Persons
    function addPerson(uint256 _favoriteNumber, string memory _name) public virtual {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameTofavoriteNumber[_name]=_favoriteNumber;
    }

    // function to retrieve People details
    function retrievePeopleDetails() public view returns (Person[] memory) {
        return listOfPeople;
    }
}

/*
data storage types in solidity :-
    1. Stack
    2. Memory
    3. Storage
    4. Calldata
    5. Code
    6. Logs
*/

/*
 storage :- data stored permanently.
 memory :- memory have temporary data that can be modified.
 calldata :- calldata also have the temporary data that can not be modified.
*/
