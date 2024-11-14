// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Struct{
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {

        // there are three ways to initialize a struct 
        todos.push(Todo(_text, false));

        // todos.push(Todo({text: _text, completed: false}));

        // Todo memory todo;
        // todo.text = _text;
        // todos.push(todo);
    }


    function get(uint index) public view returns(string memory text, bool completed){
            Todo storage todo = todos[index];
            return (todo.text, todo.completed);
        }

    function update(uint index, string calldata _text) public {
        Todo storage todo = todos[index];
        todo.text = _text;
    }

    function toggle(uint index) public {
        Todo storage todo = todos[index];
        todo.completed = !todo.completed;
    }
}