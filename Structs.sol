//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

contract Codiesalert{
    //define a structure for a emolpyee
    struct Employee{
        string Name;
        uint8 Age;
        uint8 EmpId;
        uint8[] DeptIds;
    }
    Employee public Jay;
    Employee[] Emolpyees;
    
    //Initialize the value for Employee structure
    function AddValue() public{
        Jay.Name="Jeetu";
        Jay.Age=26;
        Jay.EmpId=245;
        //Jay.DeptIds.push(567);
    }
}
