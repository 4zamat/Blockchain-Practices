pragma solidity ^0.8.15;

contract TokenMinting {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender; // Set the deployer as the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Cannot mint to the zero address");
        balances[to] += amount;
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}
