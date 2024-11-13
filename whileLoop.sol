// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract WhileLooop{
    uint[] public data;
    uint k=0;

    function loop() public returns(uint[] memory){
        while (k<5) 
        {
            data.push(k);
            k++;
        }
        return data;
    }

}