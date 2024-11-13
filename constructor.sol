// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract X{
    string public name;

    constructor(string memory _name){
        name = _name;
    }
}

contract Y{
    string public text;
    constructor(string memory _text){
        text = _text;
    }
}

// There are two ways to initialize the parent with parameters

contract B is X("Input to X"), Y("Input to Y"){

}

// Pass the parameter in constructor
// similar to function modifier 

contract C is X, Y{
    constructor(string memory _name, string memory _text) X(_name) Y(_text){}
}



// Order of Constructor called:
// 1. X
// 2. Y
// 3. D


contract D is X, Y{
    constructor() X("X was called") Y("Y was called") {}
}

// Order of Constructor called:
// 1. X
// 2. Y
// 3. E

contract E is X, Y{
    constructor() Y("Y was called") X("X was called") {}
}