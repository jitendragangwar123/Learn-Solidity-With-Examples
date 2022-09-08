// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract temperature {
    function checkTemp(uint256 temp) public pure returns (string memory) {
        if (temp < 30) {
            return "Do delivery to B and pay to A";/*Type you stament here in double quotes*/
        } else {
            return "Do not do delivery to B and do not pay to A";/*Type you stament here in double quotes*/
        }
    }
}
