//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Creating ArrayLib library and stored inside the blockchain 
library ArrayLib{
    //using storage for the state varable  
    function reverse(uint[] storage _arr) external view returns(uint[] memory){
        uint[] memory reverseArr=new uint[](_arr.length);
        uint count=1;
        for(uint i;i<_arr.length;i++){
            reverseArr[_arr.length-count]=_arr[i];
            count++;
        }
        return reverseArr;
    }
    //insert the element inside the array
    function insert(uint[] storage _Arr,uint _num) public{
        _Arr.push(_num);
    }
}

//Create a contract and used ArrayLib library for saving the gas fees 
contract ArrayReverse{

    using ArrayLib for uint[];
    uint[] public arr=[1,2,3,4,5];
    // function retruns the reversed array 
    function getReverseArr() public view returns(uint[] memory){
        return arr.reverse();
    }
    //function insert the values inside the array
    function insertNum(uint _num) public{
        arr.insert(_num);
    }
}
