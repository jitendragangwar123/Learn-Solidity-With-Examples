// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Day3 {
function sort(int256[] memory arr,uint256 len)public pure returns(int256[] memory){
    for(uint256 i=0;i<len-1;i++){
        int256 count=0;
        for(uint256 j=0;j<len-i-1;j++){
            
            if(arr[j]>arr[j+1]){
                int256 temp;
                temp=arr[j];
                arr[j]=arr[j+1];
                arr[j+1]=temp;
                count=1;
            }
        }
        if(count==0){
            break;    
        }
    }
    return arr;    

    }   
}
