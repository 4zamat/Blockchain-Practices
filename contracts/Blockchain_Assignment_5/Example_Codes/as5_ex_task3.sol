pragma solidity ^0.8.15;
contract task3 {

    address public autoPay;
    uint256 public minDonate;
    address public owner;
   
     modifier onlyOwner() {
        require(owner == msg.sender,"You are not owner");
        _;
     }
    function setMinDonate(uint256 _minDonate) external onlyOwner {
       

       minDonate = _minDonate;
    }
    function setAddress(address _autoPay) external onlyOwner {
       

       autoPay= _autoPay;

    }

    modifier minDonateRequirement() {
        require(minDonate <= msg.value,"You are greedy");
        _;
    }

    function donate() external payable minDonateRequirement {
        
        

        uint256 autoPayAmount = (msg.value*1)/100;
        payable(autoPay).transfer(autoPayAmount);
    }
      
      modifier sufficientFunds(uint256 value){
        require(address(this).balance >=value,"You are not owner");
        _;
      }
    function withdraw(uint256 value) external sufficientFunds( value) onlyOwner{
        
        
        payable(owner).transfer(value);
    }


}
