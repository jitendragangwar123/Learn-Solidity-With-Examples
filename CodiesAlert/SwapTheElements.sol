//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract RemoveArray{
    uint[] arr;

    //insert the element inside the array
    function insertElement() public{
        for(uint i=0;i<=4;i++){
            arr.push(i);
        }
    }
     
    function removeElement(uint i) public{
        // swapping the last element with given index element 
        arr[i]=arr[arr.length-1];
        //pop the lement from the array
        arr.pop();
    }
    
    //print the array
    function getArray() public view returns(uint[] memory){
        return arr;
    }
}
