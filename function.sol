// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LearnFunction {

    function addTwoNumbers(uint256 _a, uint256 _b) public pure returns (uint256) {
        uint256 new_num = _a + _b;
        return new_num;
    } 
}
