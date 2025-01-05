pragma solidity ^0.8.15;

contract MsgObjectResearch {
    uint256 public a;         // Integer variable
    uint8 public b;           // Integer variable
    string public str;        // String variable
    address public sender;    // Address of the caller
    uint256 public value;     // Ether sent with the transaction
    bytes public data;        // Full calldata of the transaction
    bytes4 public sig;        // First 4 bytes of calldata (function selector)

    // Payable function to initialize variables
    function init(uint256 _a, uint8 _b, string memory _str) external payable {
        a = _a;               // Initialize a with the first argument
        b = _b;               // Initialize b with the second argument
        str = _str;           // Initialize str with the third argument
        sender = msg.sender;  // Set sender to the address of the caller
        value = msg.value;    // Set value to the Ether sent with the transaction
        data = msg.data;      // Set data to the full calldata
        sig = msg.sig;        // Set sig to the function selector (first 4 bytes of calldata)
    }
}
