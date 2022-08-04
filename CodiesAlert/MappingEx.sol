//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract MappingEx{
    struct Employee{
        string Name;
        uint Age;
    }
    //uint=> ID and Employee => Employees
    mapping(uint=>Employee) public Employees;
    function addEmpDetails() public{
        Employees[1]=Employee("Jay",24);
    }
