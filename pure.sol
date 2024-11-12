// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Pure{
    uint num1 = 10;
    uint num2 = 20;

    // function get_data() public pure returns(uint, uint){

    //     num1 += 1; #error
    //     num2 += 1; #error

    //     uint Num1 = 30;
    //     uint Num2 = 40;

    //     uint product = Num1 * num1; #error
    //     uint total = Num2 + num2; #error

    //     return (product, total);
    // }

    function get_data() public pure returns(uint, uint){

        uint Num1 = 30;
        uint Num2 = 40;

        uint product = Num1 * Num2;
        uint total = Num1 + Num2;

        return (product, total);
    }
}