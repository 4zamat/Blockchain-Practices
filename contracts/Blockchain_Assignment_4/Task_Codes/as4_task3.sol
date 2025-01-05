pragma solidity ^0.8.15;

contract ContractChecker {
    // Function to check if the given address is a contract
    function isContract(address adr) public view returns (bool) {
        uint32 size;

        // Inline assembly to check the size of the code at the given address
        assembly {
            size := extcodesize(adr)
        }

        return (size > 0); // Returns true if the address is a contract, false otherwise
    }

    // Function to check the type of address and compare it to the current contract
    function checkContract(address adr) external view returns (string memory) {
        if (isContract(adr)) {
            if (adr == address(this)) {
                return "The twin Brother!"; // The address is the current contract
            } else {
                return "This is another contract"; // The address is a different contract
            }
        } else {
            return "This is not a contract"; // The address is not a contract
        }
    }
}
