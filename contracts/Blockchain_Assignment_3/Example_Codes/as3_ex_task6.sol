pragma solidity ^0.8.15;

contract task5 {

    struct Student {
        
        uint8 age;
        uint8[] grades;

    }

    mapping (string => Student ) public students;

    function addStudent (string memory name, uint8 age) public {
        students[ name] = Student(age,new uint8[](0));
    }

    function addGrade (string memory name,uint8 grade) public{
       students[name].grades.push(grade);
    }
}
