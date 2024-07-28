// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SecondLargest {

    // This function finds and returns the second largest integer in the given array.
    function findSecondLargest(int[] calldata arr) public pure returns (int) {
        // Ensure that the array has at least two elements
        require(arr.length >= 2, "Array length must be at least 2");

        // Initialize the largest and second largest values with the first two elements of the array
        int256 largest = arr[0];
        int256 secondLargest = arr[1];

        // Swap if the second element is greater than the first
        if (secondLargest > largest) {
            (largest, secondLargest) = (secondLargest, largest);
        }

        // Iterate over the rest of the array starting from the third element
        for (uint256 i = 2; i < arr.length; i++) {
            // If the current element is larger than the largest, update both largest and second largest
            if (arr[i] > largest) {
                secondLargest = largest; // Update second largest to be the previous largest
                largest = arr[i];        // Update largest to the current element
            } 
            // If the current element is between the largest and second largest, update second largest
            else if (arr[i] > secondLargest && arr[i] < largest) {
                secondLargest = arr[i];
            }
        }

        // Return the second largest element found
        return secondLargest;
    }
}
