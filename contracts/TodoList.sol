// SPDX-License-Identifier: UNLICENSED
// Write a to-do smart Contract that makes use of struct and arrays.no event, no  mapping.
// A user can create a to-do see all todos they create.Add a status of isDone using a boolean.
// One function should toggle the isDone status.Users should be able to update title, 
// description, isdone status and delete to-do.Finally, write and test with remix and hardhat."

pragma solidity ^0.8.17;
    
contract TodoList{

    struct Todo{
        string title;
        string description;
        uint256 id;
        bool isDone;
    }

    Todo[] public todos;

    function createTodo(string memory _title, string memory _description, uint256 _id, bool _isDone) external {
    uint256 todoId = todos.length;
    todos.push(Todo(_title, _description, _id, false));
    }

    function toggleIsDone(uint256 _id) external {
        require(_id < todos.length, "Todo does not exist");
        todos[_id].isDone = !todos[_id].isDone;
    }

    function updateTodo(string memory _title, string memory _description, bool _isDone, uint256 _id) external {
        require(_id < todos.length, "Todo does not exist");
        todos[_id].title = _title;
        todos[_id].description = _description;
        todos[_id].isDone = _isDone;
    }

    function deleteTodo(uint256 _id) external {
        require(_id < todos.length, "Todo does not exist");
        delete todos[_id];
    }
    function getTodosCount() external view returns (uint256) {
        return todos.length;
    }

}
