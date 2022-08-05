//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract BytesArray{
    //fixed length of the array
    bytes4 public name1="Jay";
    bytes32 public name2="Kumar";
    //dyanmic lenth of the array
    bytes public name3="Jay Gangwar";

    function access()public view returns(bytes4){
        return name1[2];
    }

    //There are only two operations performed in bytes(1.length and 2.pop)
    //We can not perform push operation in bytes 
    function accesslength() public view returns(uint){
        return name3.length;
    }
    //pop() operation perform onl for bytes
    function popOperation()public{
        name3.pop();
    }
}

