//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
    string public name="Jay";
    address owner;
    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
      require(owner==msg.sender,"You are not the right owner.");
      _;
    }

    function changeName(string memory _newName)public onlyOwner{
        name=_newName;
    }
}


//you can pass the value in modifier for the addional checking 
//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
    string public name="Jay";
    address owner;
    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(uint _num){
      require(owner==msg.sender,"You are not the right owner.");
      _;
    }

    function changeName(string memory _newName)public onlyOwner(5){
        name=_newName;
    }
}
