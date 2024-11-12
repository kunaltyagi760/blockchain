// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract condition{
    string public hello;

    //  function getDate(uint _value) public returns(string memory){
    //     if (_value == 5){
    //         hello = "five";
    //     }else {
    //         hello = "not five";
    //     }
    //     return hello;
    //  }

    function getDate(uint _value) public returns(string memory){
        // if (_value == 5){
        //     hello = "five";
        // }else {
        //     hello = "not five";
        // }
        return _value==5 ? hello = "five" : hello = "not five";
     }
}