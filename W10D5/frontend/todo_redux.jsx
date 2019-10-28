import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveTodos, receiveTodo, fetchTodos } from "./actions/todo_actions";
import Root from "./components/root";
import allTodos from "./reducers/selectors";


document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("root");
  const store = configureStore();
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;
  window.fetchTodos = fetchTodos;
  ReactDOM.render(<Root  store={store} />, root);
});