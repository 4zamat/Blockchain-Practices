// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface ITokenHook {
    function onTransfer(address from, address to, uint256 amount) external;
    function onMint(address to, uint256 amount) external;
    function onBurn(address from, uint256 amount) external;
}

contract CustomToken is ERC20 {
    mapping(address => ITokenHook) public hooks;
    address public owner;

    event HookRegistered(address indexed user, address hookContract);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
    }

    function registerHook(address hookContract) external {
        require(hookContract != address(0), "Invalid hook address");
        hooks[msg.sender] = ITokenHook(hookContract);
        emit HookRegistered(msg.sender, hookContract);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {
    if (from != address(0) && address(hooks[from]) != address(0)) {
        hooks[from].onTransfer(from, to, amount);
    }
    }


    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        if (address(hooks[to]) != address(0)) {
            hooks[to].onMint(to, amount);
        }
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
        if (address(hooks[msg.sender]) != address(0)) {
            hooks[msg.sender].onBurn(msg.sender, amount);
        }
    }
}