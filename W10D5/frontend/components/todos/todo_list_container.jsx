import React from 'react';
import { connect } from 'react-redux';
import allTodos from "../../reducers/selectors";
import {receiveTodo} from "../../actions/todo_actions";
import todoList from "./todo_list";

//presentational component is surronded by a container container has access to state and actions to component

//mapstatetoprops returns an object
const mapStateToProps = (state)=>{
  return {
    todos: allTodos(state)
  };
};

const mapDispatchToProps = dispatch => ({
  receiveTodo: todo => dispatch(receiveTodo(todo))
});

export default connect(mapStateToProps, mapDispatchToProps)(todoList);