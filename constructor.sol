//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
   string public name;
    //constructor
    constructor(){
        name="jay";
    }
}


//parameterized constructor
//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
   string public name;
    //constructor
    constructor(string memory _name){
        name=_name;
    }
}
