// SPDX-License-Identifier: MIT

// Importing the SillyStringUtils library
library SillyStringUtils {

    struct Haiku {
        string line1;
        string line2;
        string line3;
    }

    function shruggie(string memory _input) internal pure returns (string memory) {
        return string.concat(_input, unicode" 🤷");
    }
}

pragma solidity 0.8.17;

contract ImportsExercise {
    // Using the SillyStringUtils library for string manipulation
    using SillyStringUtils for string;

    // Declaring a public variable to store a Haiku
    SillyStringUtils.Haiku public haiku;

    // Function to save a Haiku
    function saveHaiku(string memory _line1, string memory _line2, string memory _line3) public {
        haiku.line1 = _line1;
        haiku.line2 = _line2;
        haiku.line3 = _line3;
    }

    // Function to retrieve the saved Haiku
    function getHaiku() public view returns (SillyStringUtils.Haiku memory) {
        return haiku;
    }

    // Function to append a shrugging emoji to the third line of the Haiku
    function shruggieHaiku() public view returns (SillyStringUtils.Haiku memory) {
        // Creating a copy of the Haiku
        SillyStringUtils.Haiku memory newHaiku = haiku;
        // Appending the shrugging emoji to the third line using the shruggie function from the SillyStringUtils library
        newHaiku.line3 = newHaiku.line3.shruggie();
        return newHaiku;
    }
}