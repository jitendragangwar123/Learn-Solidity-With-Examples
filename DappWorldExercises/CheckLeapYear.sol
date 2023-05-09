// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.9.0;
/// @title A contract for demonstrate Relational Operators in Solidity 
/// @author Jitendra Kumar
/// @notice For now, this contract just show how to check if a given year is leap year
contract GFG {
	function checkYear(uint year) public pure returns(bool){
		// Return true if year is a multiple
		// of 4 and not multiple of 100.
		// OR year is multiple of 400.
		return (((year % 4 == 0) && (year % 100 != 0)) ||(year % 400 == 0));
	}
}
