pragma solidity ^0.8.15;
contract task7 {

    mapping(address => uint256) public donators;
    address public owner = address(0);

    function setOwner() external returns (bool) {

        if(owner == address(0)) {
            owner = msg.sender;
            return true;
        }
        return false;
    }

    function donate() external payable {
        donators[msg.sender] += msg.value;
    }

    function getDonator(address adr) external view returns (uint256){

        return donators[adr];
    }

    function getBalance() external view returns(uint256){
        if(msg.sender == owner){
            return address(this).balance;
        }
        return 0;

    }
}
