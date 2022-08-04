//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Structure{

    struct Employee{
        string Name;
        uint8 EmpId;
        uint8 Age;
        uint8[] EmpIds;//EmpIds Array
    }
    //Employee => DataType Jeetu => Variable
    Employee public Jeetu;
    //Array Declaration
    Employee[] Employees;
    //Add the emp details
    function addEmp() public{
        Jeetu.Name="Jay";
        Jeetu.EmpId=123;
        Jeetu.Age=24;
        Jeetu.EmpIds.push(123);
    }
}
