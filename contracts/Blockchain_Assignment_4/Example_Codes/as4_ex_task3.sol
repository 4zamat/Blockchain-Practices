pragma solidity ^0.8.15;
contract task3 {

   function  isContract(address adr) public view returns(bool) {

      uint32 size;

      assembly {

        size := extcodesize(adr)
      }

      return (size > 0);
   } 

   function checkContract(address adr) external view returns (string memory){

       if(isContract(adr)) {

           if(adr == address(this)) {
                return "The twin brothers!";
           } else {
                  return "This is another contract";
           }
           
       } else {
             
             return  "This is not a contract";
       }
   }
}
