// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(uint id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);

    constructor() {
        createTask("İlk görev: Solidity öğren!");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task storage task = tasks[_id];
        task.completed = !task.completed;
        emit TaskCompleted(_id, task.completed);
    }

    function getTask(uint _id) public view returns (string memory content, bool completed) {
        Task memory task = tasks[_id];
        return (task.content, task.completed);
    }
}
