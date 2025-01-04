pragma solidity ^0.8.15;

contract task4 {

    struct Student {
        string name;
        uint8 age;
        uint8[] grades;

    }

    Student[] public students;

    function addStudent (string memory name, uint8 age) public {
        students.push(Student(name,age,new uint8[](0)));
    }

    function addGrade (string memory name,uint8 grade) public{
        for (uint256 i = 0; i<students.length; i++){
            if (keccak256(abi.encodePacked(students[i].name)) == keccak256(abi.encodePacked(name))){
                students[i].grades.push(grade);
            }
        }
    }
}
