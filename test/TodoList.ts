import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("TodoList", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployTodoList() {

    const TodoList = await ethers.getContractFactory("TodoList");
    const todoList = await TodoList.deploy();
    
    return { todoList};
  }

    // Create todo
    await todoList.createTodo(
        "Todo 1",
        "Description for Todo 1",
        0,
        false
    );

    // Toggle isDone status
    await todoList.toggleIsDone(0);

    // Update todo
    await todoList.updateTodo(
        "Updated Todo 1",
        "Updated Description for Todo 1",
        true,
        0
    );

    // Delete todo
    await todoList.deleteTodo(0);

    // Get todos count
    const todosCount = await todoList.getTodosCount();
    console.log("Total Todos:", todosCount.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
    });
  });

