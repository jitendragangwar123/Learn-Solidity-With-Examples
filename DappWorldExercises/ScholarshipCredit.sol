// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ScholarshipCreditContract {
    address private owner;
    address merchantAddress;
    address studentAddress;
    mapping(address => uint256) private balances;
    mapping(address => bool) private merchants;
    mapping(address => bool) private scholarshipHolders;

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyScholarshipHolder() {
        require(scholarshipHolders[msg.sender]);
        _;
    }

    modifier onlyRegisteredMerchant() {
        require(merchants[msg.sender]);
        _;
    }

    //This function assigns credits to student getting the scholarship
    function grantScholarship(address _studentAddress, uint credits) public onlyOwner  {
        require(_studentAddress!=merchantAddress);
       // require(credits>=10000);
        studentAddress=_studentAddress;
        balances[studentAddress] += credits;
        scholarshipHolders[studentAddress] = true;
    }

    //This function is used to register a new merchant who can receive credits from students
    function registerMerchantAddress(address _merchantAddress) public onlyOwner  {
        require(_merchantAddress!=studentAddress);
        require(_merchantAddress!=msg.sender);
        merchantAddress=_merchantAddress;
        merchants[merchantAddress] = true;
    }

    //This function is used to deregister an existing merchant
    function deregisterMerchantAddress(address _merchantAddress) public onlyOwner  {
        merchantAddress=_merchantAddress;
        merchants[merchantAddress] = false;
    }

    //This function is used to revoke the scholarship of a student
    function revokeScholarship(address _studentAddress) public onlyOwner {
        studentAddress=_studentAddress;
        balances[studentAddress] = 0;
        scholarshipHolders[studentAddress] = false;
    }

    //Students can use this function to transfer credits only to registered merchants
    function spend(address _merchantAddress, uint amount) public onlyScholarshipHolder{
        merchantAddress=_merchantAddress;
        require(merchants[merchantAddress]);
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[merchantAddress]+=amount;
    }

    //This function is used to see the available credits assigned.
    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
