//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
    function StringConcate(string memory _a,string memory _b)public pure returns(string memory){
        return string(abi.encodePacked(_a," ",_b));//string is used for convert the abi code into string 
    }
}
