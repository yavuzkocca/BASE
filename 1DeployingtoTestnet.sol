// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicMath {

    // Adder function
    function adder(uint _a, uint _b) public pure returns (uint sum, bool error) {
        unchecked {
            sum = _a + _b;
            if (sum < _a) { // This means an overflow occurred
                return (0, true);
            }
            return (sum, false);
        }
    }

    // Subtractor function
    function subtractor(uint _a, uint _b) public pure returns (uint difference, bool error) {
        if (_a >= _b) {
            difference = _a - _b;
            return (difference, false);
        } else {
            return (0, true);
        }
    }
}