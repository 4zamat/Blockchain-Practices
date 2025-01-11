pragma solidity ^0.8.15;

contract TextManager {
    // State variable to store the text
    string public text;

    // Function to update the value of text
    function updateText(string memory newText) public {
        text = newText; // Update the state variable with the new value
    }

    // Function to return the current value of text
    function getText() public view returns (string memory) {
        return text; // Return the current value of the state variable
    }
}

// OK