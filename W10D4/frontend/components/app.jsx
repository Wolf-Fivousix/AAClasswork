import React from 'react';
import TodoListContainer from "./todos/todo_list_container";
import TodoForm from "./todo_list/todo_form";

const App = ()=>{
  return (
    <div>
      <TodoListContainer />
      <TodoForm />
    </div>
  );
};

export default App;