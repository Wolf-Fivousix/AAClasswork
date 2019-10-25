function allTodos (state) {
  const keys = Object.keys(state.todos);
  const todos = [];
  keys.forEach(el => { todos.push(state.todos[el]); });
  return todos;
}


export default allTodos;



// const mapDispatchToProps = (dispatch) => {
//   return {
//     receiveTea: (tea) => dispatch(receiveTea(tea)),
//   };
// };