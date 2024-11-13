// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Require{

    function odd(uint _n) public pure returns(bool){
        require(_n%2 != 0);
        return true;
    }
}