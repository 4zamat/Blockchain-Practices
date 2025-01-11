pragma solidity ^0.8.15;

contract task2 {

    address public autoPay;
    uint256 public minDonate;
    address public owner;
    function setMinDonate(uint256 _minDonate) external {
       require(owner == msg.sender,"You are not owner");

       minDonate = _minDonate;
    }
    function setAddress(address _autoPay) external {
       require(owner == msg.sender,"You are not owner");

       autoPay= _autoPay;

    }

    function donate() external payable {
        require(minDonate <= msg.value,"You are greedy");

        uint256 autoPayAmount = (msg.value*1)/100;
        payable(autoPay).transfer(autoPayAmount);
    }

    function withdraw(uint256 value) external{
        require(owner == msg.sender,"You are not owner");
        require(address(this).balance >=value,"You are not owner");
        payable(owner).transfer(value);
    }


}
