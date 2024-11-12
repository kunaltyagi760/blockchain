// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract View{
    uint public num1 = 2;
    uint public num2 = 5;

    // function getResul() public view returns(uint, uint){
    //     return (num1, num2);
    // }

    // function getResult() public  view returns(uint product, uint total){
    //     product = num1 * num2;
    //     total = num1 + num2;

    //     return (product, total);
    // }

    function getResult() public returns(uint product, uint total){
        num1 += 5;
        num2 += 5;

        product = num1 * num2;
        total = num1 + num2;

        return (product, total);
    }
}