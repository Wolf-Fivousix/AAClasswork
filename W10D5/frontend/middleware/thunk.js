
const myThunk = (store) => (next) => (action) => {
  // if(action typeof "function")
  if(typeof action === "function") {
    return action(store.dispatch);
  }
  else return next(action);
};

export default myThunk;