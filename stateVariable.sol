// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract stateVariable{

    string name;
    uint num;

    constructor(string memory _name, uint _num){
        name = _name;
        num = _num;
    }
}