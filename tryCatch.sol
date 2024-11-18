// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Foo {
    address public owner;

    // Constructor to set the owner, ensuring it's not an invalid address
    constructor(address _owner) {
        require(_owner != address(0), "Invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    // A simple function that fails if input `x` is zero
    function myFunc(uint x) public pure returns (string memory) {
        require(x != 0, "require failed");
        return "my func is called";
    }
}

contract Bar {
    // Events for logging results
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    // Deploys a new Foo contract during deployment of Bar
    constructor() {
        foo = new Foo(msg.sender);
    }

    // Try-catch for external call to Foo's `myFunc`
    function tryCatchExternalCall(uint _x) public {
        try foo.myFunc(_x) returns (string memory result) {
            emit Log(result); // Log successful result
        } catch Error(string memory reason) {
            // Catch reverts with reason string
            emit Log(reason);
        } catch (bytes memory lowLevelData) {
            // Catch low-level errors (without reason string)
            emit LogBytes(lowLevelData);
        }
    }

    // Try-catch for creating a new Foo contract
    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns(Foo newFoo) {
            emit Log("New Foo created"); // Log successful contract creation
            newFoo;
        } catch Error(string memory reason) {
            // Catch reverts with reason string
            emit Log(reason);
        } catch (bytes memory lowLevelData) {
            // Catch low-level errors (without reason string)
            emit LogBytes(lowLevelData);
        }
    }
}
