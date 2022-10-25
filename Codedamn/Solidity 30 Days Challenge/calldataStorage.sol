//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
   string name="jay";
    //calldata storage
    function displayName(string calldata _a)external pure returns(string calldata){
        //can not modify the parameterized variable
        // _a="gangwar";
        return _a;
    }
    
    //Access the external function on the same contract
    function accessExternal()public view returns(string memory){
        return this.displayName(name);
    }
}
