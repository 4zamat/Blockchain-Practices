pragma solidity ^0.8.15;

contract StringStorage {
    string public text;

    function setText(string memory _text) public {
        text = _text;
    }

    function appendText(string memory _newText) public {
        text = string(abi.encodePacked(text, _newText));
    }

    function clearText() public {
        text = "";
    }

    function getText() public view returns (string memory) {
        return text;
    }
}
