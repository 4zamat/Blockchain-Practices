pragma solidity ^0.8.15;

contract task4 {

    int256 public sum;
    int256 public sub;
    int256 public mult;
    int256 public div;

    function addition (int256 number1,int256 number2) internal {
        sum=number1+number2;

    }
    function substraction (int256 number1,int256 number2) internal {
        sub=number1-number2;
    }
     
    function multiplication (int256 number1,int256 number2) internal {
        mult=number1*number2;
    }
    
    function division (int256 number1,int256 number2) internal {
        require (number2 !=0,'No division by zero');
        div=number1/number2;
    }
     
    function getResult() internal view returns (int256,int256,int256,int256) {
       return (sum,sub,mult,div);
    }
      
    function start (int256 number1, int256 number2) public returns (int256,int256,int256,int256){
      addition (number1,number2);
      substraction (number1,number2);
      multiplication (number1,number2);
      division (number1,number2);
      int256 _sum;
      int256 _sub;
      int256 _mult;
      int256 _div;
      (_sum,_sub,_mult,_div) = getResult();
      return (_sum,_sub,_mult,_div);
    }
}
