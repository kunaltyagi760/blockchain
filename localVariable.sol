// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Localvariable{

    uint public myNum;

    function local() public returns(uint){
        uint num = 3534;
        myNum = num;
        return myNum;
    }
}