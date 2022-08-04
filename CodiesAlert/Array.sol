//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Array{
    struct College{
        string Name;
        uint8 Id;
        uint8[] deptIds;
    }
    College[] colleges;

    //fixed size Array
    uint[10] public Num1;
    //dynamic size Array
    uint[] public Num2;
    uint[] public Num3=[1,2,3];

    //Operations performed in Array
    //push operation
    function pushArray(uint _num1)public{
        //dynamic array not initialized in function 
        uint[] memory tempArray=new uint[](5);
        Num2.push(_num1);
    }
    //pop operation
    function popArray() public{
        Num2.pop();
    }

    //length operation
    function lengthArray() public view returns(uint){
        return Num2.length;
    }
    
    // delete element using index 
    function deleteArray(uint _index) public{
        delete Num2[_index];
    }

}
