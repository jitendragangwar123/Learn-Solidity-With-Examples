//fallback.sol

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Fallback{
    string public calledFunction;
    fallback() external payable{
        calledFunction="fallback function called!";
    }
    receive() external payable{
        calledFunction="Receive function called!";
    }

    function getBal() public view returns(uint){
        return address(this).balance;
    }
}

//sendEther.sol
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract sendEther{
    
    //transfer function is revert the transaction if any error occured in between any transaction but send function did not revert the transaction. 
    // function sendEth() public payable{
    //     payable(0x417Bf7C9dc415FEEb693B6FE313d1186C692600F).transfer(1 ether);
    // }
    // function sendEthWithSendFun() public payable{
    //     bool success=payable(0x09943Fa8DD32C76f7b880627a0F6af73e8f5A595).send(1 ether);
    // }

    //Best way to transfer ether by using call function
    function sendEthWithCallFun() public payable{
        (bool success,)=payable(0x09943Fa8DD32C76f7b880627a0F6af73e8f5A595).call{value : 1 ether}("Jay Gangwar");
        require(success,"Transfer Failed!");
    }

    function getBal() public view returns(uint){
        return address(this).balance;
    }
}


