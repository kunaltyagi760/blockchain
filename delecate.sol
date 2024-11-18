// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract B{
    uint public num;
    address public addr;
    uint public value;

    function setVars(uint _num) public payable {
        addr = msg.sender;
        num = _num;
        value = msg.value;
    }
}

contract A{
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint)", _num)
        );

        (success, data);
    }
}