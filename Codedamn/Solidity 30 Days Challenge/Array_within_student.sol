// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
contract Day6 {
    struct Student{
        string name;
        uint256[3] marks;
    }
    Student student;
    function set(string memory _name,uint256 _m1,uint256 _m2,uint256 _m3)public{
        uint256 i=0;
        student.name=_name;
        student.marks[i]=_m1;
        i++;
        student.marks[i]=_m2;
        i++;
        student.marks[i]=_m3;
    }
    function get()public view returns(string memory,uint256,uint256,uint256){
        return (student.name,student.marks[0],student.marks[1],student.marks[2]);
    }     
    
}
