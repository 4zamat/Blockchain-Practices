pragma solidity ^0.8.15;

contract calculator {
    int32 private num1;
    int32 private num2;
    int64 private result;
    string private operation;

    function summa(int32 number1,int32 number2) public  returns (int64) {
         num1 = number1;
         num2 =  number2;
         result = int64 (num1+num2);
         operation = "Summa";
         return result;
    }

    function substraction(int32 number1,int32 number2) public  returns (int64) {
         num1 = number1;
         num2 =  number2;
         result = int64(num1-num2);
         operation = "Substraction";
         return result;  
    }

    function multiplication (int32 number1,int32 number2) public  returns (int64) {
         num1 = number1;
         num2 =  number2;
         result = int64(num1*num2);
         operation = "Multiplication";
         return result;  
    
    }

    function division  (int32 number1,int32 number2) public  returns (int64) {
        require (number2 != 0, "can not divide by zero");

         num1 = number1;
         num2 =  number2;
         result = int64(num1/num2);
         operation = "Division";
         return result;
        }

    function getLastOperation () public view returns (int32,int32,int64,string memory) {
        return (num1,num2,result,operation);
    }
}
