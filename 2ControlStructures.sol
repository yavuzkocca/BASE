// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ControlStructures {

    // FizzBuzz function
    function fizzBuzz(uint _number) public pure returns (string memory) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    // Custom error for AfterHours
    error AfterHours(uint _time);

    // DoNotDisturb function
    function doNotDisturb(uint _time) public pure returns (string memory) {
        // If _time is greater than or equal to 2400, trigger a panic
        assert(_time < 2400);

        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        } else if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        } else if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        } else {
            return "Invalid time!"; // This line ensures all code paths return a value
        }
    }
}
