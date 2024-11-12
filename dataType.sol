// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// contract DataType {
//     bool public hey;
//     bool public no=true;
//     uint8 public u8 = 1;
//     uint public n256 = 56;
//     uint public u = 2345;

//     int public minInt = type(int).min;
//     int public maxInt = type(int).max;
// }

contract LearnFunction {
    uint hey;

    function getInfo() public view returns(uint) {
        return hey;
    }
}