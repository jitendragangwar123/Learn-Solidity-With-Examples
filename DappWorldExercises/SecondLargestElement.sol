// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SecondLargest {

    //this function outputs the second largest integer in the array
    function findSecondLargest(int[] calldata arr) public pure returns (int) {
        require(arr.length >= 2, "Array length must be at least 2");

        int256 largest = arr[0];
        int256 secondLargest = arr[1];

        if (secondLargest > largest) {
            (largest, secondLargest) = (secondLargest, largest);
        }

        for (uint256 i = 2; i < arr.length; i++) {
            if (arr[i] > largest) {
                secondLargest = largest;
                largest = arr[i];
            } else if (arr[i] > secondLargest && arr[i] < largest) {
                secondLargest = arr[i];
            }
        }

        return secondLargest;
    }
}
