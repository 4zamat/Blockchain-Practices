pragma  solidity ^0.8.15;

contract task8 {

    receive() external payable{}
    function getContractBalance() external view returns (uint256){

        return address(this).balance;
    }

     function getAddressBalance(address adr) external view returns(uint256){

        return adr.balance;
     }

     function distributeEth(address[] memory addresses) external payable  {

        uint256 totalEth = msg.value;
        uint256 numberOfRecepients = addresses.length + 1;
        uint256 amountPerRecepient = totalEth / numberOfRecepients;
        uint256 remainingBalance = totalEth % numberOfRecepients;
         for (uint256 i = 0;i < numberOfRecepients; i++){
            payable(addresses[i]).transfer(amountPerRecepient);
         }
         payable(address(this)).transfer(amountPerRecepient + remainingBalance);


     }
}
