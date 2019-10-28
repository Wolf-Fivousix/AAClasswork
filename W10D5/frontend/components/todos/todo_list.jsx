import React from 'react';
import TodoListItem from "../todo_list/todo_list_item";

const todoList = (props)=> {
  return (
  <ul>
    {props.todos.map( (el, i) =>{
      return (
      <li key={i}>
        <TodoListItem todo={el}/>
      </li>
      );
    })}
  </ul>
  );
};

export default todoList;