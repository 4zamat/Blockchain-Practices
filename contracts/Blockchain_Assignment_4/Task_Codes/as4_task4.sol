pragma solidity ^0.8.15;

contract AccessControl {
    // Private variable to store the admin address
    address private admin;

    // Modifier to restrict access to only the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Access denied: Only admin can call this function");
        _;
    }

    // Constructor to initialize the admin address to the deployer's address
    constructor() {
        admin = msg.sender;
    }

    // Function to change the admin address, restricted to the current admin
    function changeAdmin(address newAdmin) public onlyAdmin {
        require(newAdmin != address(0), "Invalid address: Admin cannot be the zero address");
        admin = newAdmin;
    }

    // Function to demonstrate restricted access
    function restrictedFunction() public view onlyAdmin returns (string memory) {
        return "This function is restricted to the admin";
    }

    // Function to get the current admin address (optional for testing purposes)
    function getAdmin() public view returns (address) {
        return admin;
    }
}
