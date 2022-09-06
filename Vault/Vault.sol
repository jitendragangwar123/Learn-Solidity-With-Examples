//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./IERC20.sol";

contract Vault{
    IERC20 public immutable token;
    uint public totalSupply;
    mapping(address=>uint) public balanceOf;
    constructor(address _token){
        token=IERC20(_token);
    }
    function _mint(address _to,uint _amount) private{
        totalSupply+=_amount;
        balanceOf[_to]+=_amount;
    }
    function _burn(address _to,uint _amount) private{
        totalSupply-=_amount;
        balanceOf[_to]-=_amount;
    }
    function deposite(uint _amount) external{
        /*
        a=amount
        B=blance of token before deposit
        T=total supply
        s=shares to mint
        (T+s)/T=(a+B)/B

        s=aT/B
        */
        uint shares;
        if(totalSupply==0){
            shares=_amount;
        }else{
            shares=(_amount*totalSupply)/token.balanceOf(address(this));
        }
        _mint(msg.sender,shares);
        token.transferFrom(msg.sender, address(this),_amount);
    }
    function withdraw(uint _shares) external{
        /*
        a=amount
        B=balance of token before withdraw
        T=total supply
        s=shares to burn
        (T-s)/T=(B-a)/B
        a=sB/T
        */
        uint amount=(_shares*token.balanceOf(address(this)))/totalSupply;
        _burn(msg.sender,_shares);
        token.transfer(msg.sender,amount);
    }
}

