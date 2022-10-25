pragma solidity ^0.6.0;

contract MyContract{
    uint[] public numbers=[1,2,3,4,5,6,7,8,9,10,11];

    address public owner;
    modifier onlyOwner
	{
		require(owner == msg.sender);
		_;
	}

    constructor() public{
        owner=msg.sender;
    }
    
    function isEvenNumber(uint _number1) public pure returns(bool){
        if(_number1%2==0){
            return true;
        }
        else{
            return false;
        }    
    }
    
    function countEvenNumbers() public onlyOwner view returns(uint){
        uint countEven=0;
        for(uint i=0;i<numbers.length;i++){
            if(isEvenNumber(numbers[i])){
                countEven++;
            }
        }
        return countEven;
    } 

    function isOddNumber(uint _number2) public pure returns(bool){
        if(_number2%2!=0){
            return true;
        }
        else{
            return false;
        }    
    }

    function countOddNumbers() public onlyOwner view returns(uint){
        uint countOdd=0;
        for(uint i=0;i<numbers.length;i++){
            if(isOddNumber(numbers[i])){
                countOdd++;
            }
        }
        return countOdd;
    } 
} 
    
    // function isOwner() public view returns(bool){
    //     return(msg.sender==owner);
    //     /*if(msg.sender==owner){
    //         return true;
    //     }
    //     else{
    //         return false;
    //     }*/
    // }

