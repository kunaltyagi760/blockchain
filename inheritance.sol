// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract A{
    function foo() public pure virtual returns(string memory){
        return "A";
    }
}


// contracts inherit other contract by using keyword is 
contract B is A {
    function foo () public pure virtual override returns(string memory){
        return "B";
    }
}

contract C is A {
    function foo () public pure virtual override returns(string memory){
        return "C";
    }
}

// contracts can inherit from multiple parent contracts when a function called that is defined multiple times in differnet contracts
// parent contract are searched from left to right and depth first manner.

contract D is B, C {
    // D foo return C's foo
    function foo() public pure override(B,C) returns(string memory){
        return super.foo();
    }
}

contract E is C, B{
    // E foo return B's foo
    function foo() public pure override(C, B) returns(string memory){
        return super.foo();
    }
}

contract F is A, B{
    // F foo return B's foo
    function foo() public pure override(A, B) returns(string memory){
        return super.foo();
    }
}