pragma solidity ^0.8.15;

contract StringStorage {
    // State variable to store the string
    string public text;

    // Function to initialize the string
    function setText(string memory _text) public {
        text = _text; // Set the text variable to the provided value
    }

    // Function to append a new string to the existing text
    function appendText(string memory _newText) public {
        text = string(abi.encodePacked(text, _newText)); // Concatenate text with _newText
    }

    // Function to reset the text to an empty string
    function clearText() public {
        text = ""; // Set text to an empty string
    }

    // Function to return the current value of text
    function getText() public view returns (string memory) {
        return text; // Return the value of text
    }
}
