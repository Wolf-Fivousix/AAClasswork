import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";



const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};
// const newTodos = [{ id: 0, title: "walk dog", body: "fun", done: false }, { id: 2, title: "slay dragon", body: "make sure not to die", done: true }, { id: 3, title: "become wolf", body: "not a vampire", done: true }, { id: 50, title: "become wolf", body: "not a vampire", done: true }];

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state); //copies old state with a new object
  
  switch (action.type) {
    case (RECEIVE_TODOS):
      action.todos.forEach( el => { nextState[el.id] = el; });
      return nextState;

    case (RECEIVE_TODO):
      nextState[action.todo.id] = action.todo;
      return nextState;

    default:
      return state;
  }
};

export default todosReducer;