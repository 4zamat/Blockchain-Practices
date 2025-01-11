pragma solidity ^0.8.15;

contract TextManager {
    string public text;

    function updateText(string memory newText) public {
        text = newText;
    }

    function getText() public view returns (string memory) {
        return text;
    }
}

// OK