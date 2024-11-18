// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Reciever{
    event Recieved(address caller, uint amount, string message);

    receive() external payable { }  

    fallback() external payable {
        emit Recieved(msg.sender, msg.value, "Fallback is called");
     }   

    function foo(string memory _msg, uint x)public payable returns(uint){
        emit Recieved(msg.sender, msg.value, _msg);

        return x+1;
    }
}

contract Caller{
    event Response(bool success, bytes data);

    function testCallFoo(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}(
            abi.encodeWithSignature("foo(string, uint)", "call foo", 123)
        );

        emit Response(success, data);
    }

    function testCallDoesNotExist(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}