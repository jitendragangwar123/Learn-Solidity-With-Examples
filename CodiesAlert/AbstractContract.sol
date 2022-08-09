//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
// Abstract COntract:- Contract is one which contains at least one function without any implementation
//base contract
abstract contract x{
    function y() public view virtual returns(string memory);
}

//derived  contract 
contract z is x{
    function y() public pure override returns(string memory){
        return "hello";
    }
}
