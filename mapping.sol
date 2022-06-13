pragma solidity >=0.4.22 <0.9.0;

contract Day3 {
    mapping(address => uint256) balances;

    function updateBalance(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }

    function checkBalance(address _user) public view returns (uint256) {
        require(msg.sender == _user, "You are not the owner of the account");
        return balances[_user];
    }
}
