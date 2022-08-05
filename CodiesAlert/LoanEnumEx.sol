//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract LoanEnumEx{
    enum LoanStatus {Applied,Inprogress,Verified,Approved}
    //LoanStatus is datatype and JayLoanStatus is variable
    LoanStatus JayLoanStatus;
    function applyLoan() public returns(uint,LoanStatus){
        JayLoanStatus=LoanStatus.Applied;
        return (block.timestamp,JayLoanStatus);
    }
    
    function checkProgress() public{
        JayLoanStatus=LoanStatus.Inprogress;
    }

    function checkInprogress() public view returns(bool){
        require(JayLoanStatus==LoanStatus.Inprogress);
        return true;
    }
} 

