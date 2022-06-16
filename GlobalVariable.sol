//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract Codiesalert{
    address public _owner=msg.sender;
    bytes public _msgdata=msg.data;
    uint public _blocknumber=block.number;//by default it takes 0
    bytes32 public _blockhash=blockhash(2);//2 is the block number
    address public _coinbase=block.coinbase;
    uint public _gaslimit=block.gaslimit;
    uint public _blocktime=block.timestamp;
    uint public _gasleft=gasleft();
    address public originalcaller=tx.origin;//initial user address
}
