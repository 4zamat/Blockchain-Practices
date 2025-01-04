pragma solidity ^0.8.15;

contract task3 {

    string public str1;
    string public str2;
     
     function addStr (uint8 choice,string memory str) public {
    
       if (choice == 1) {
           str1 = string (abi.encodePacked(str1,str)); 

       } else if (choice ==2) {
          str2 = string (abi.encodePacked(str2,str));
       }

     }

     function compare () public view returns (bool){
        return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
     }

     function clear  (uint8 choice) public {

        if (choice == 1) {
           str1 = ""; 

       } else if (choice ==2) {
          str2 = "";
       }
     }
      


}   
