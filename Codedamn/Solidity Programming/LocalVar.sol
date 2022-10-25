// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract LocalVar {
    string public str1="hello1"; //state variable
    function getLocal() public pure returns(int){
        /*string str1="hello1"; => It generates the error because string and array bydefault stored 
                                   into the contract storage at contract level.*/
        string memory str="hello"; //local variable => Don't cost any kind of gas bcz stored into the stack
        int LocalVar=10; //local variable
        return LocalVar;
    }
}
