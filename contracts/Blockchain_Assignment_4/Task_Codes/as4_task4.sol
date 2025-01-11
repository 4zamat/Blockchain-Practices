pragma solidity ^0.8.15;

contract AccessControl {
    address private admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Access denied: Only admin can call this function");
        _;
    }

    // Constructor to initialize the admin address to the deployer's address
    constructor() {
        admin = msg.sender;
    }

    function changeAdmin(address newAdmin) public onlyAdmin {
        require(newAdmin != address(0), "Invalid address: Admin cannot be the zero address");
        admin = newAdmin;
    }

    function restrictedFunction() public view onlyAdmin returns (string memory) {
        return "This function is restricted to the admin";
    }

    function getAdmin() public view returns (address) {
        return admin;
    }
}
