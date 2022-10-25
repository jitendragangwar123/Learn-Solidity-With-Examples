// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Day4 {
    function distinct(int256[] memory arr,uint256 len)public pure returns(uint256){
        uint256 count=1;
        uint256 i;
        uint256 j;
        for(i=1;i<len;i++){
            for(j=0;j<i;j++){
                if(arr[i]==arr[j]){
                break;
            }
        }
        if(i==j){
            count++;
        }
    } 
    return count;
    }
}
