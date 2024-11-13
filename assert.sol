// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Assert{

    bool public result;

    function checkOverflow(uint _num1, uint _num2) public {
        uint sum = _num1 + _num2;
        assert(sum <= 255);
        result = true;
    }
}