import React from "react";
import ReactDOM from "react-dom";
import {
  logout
} from "./util/session_api_util";
import configureStore from "./store/store";
import Root from "./components/root";


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  let store = null;
  
  if (window.currentUser) {
    const preloadedState = {
      entities: {
        users: { [window.currentUser.id]: window.currentUser }
      },
      session: { currentUser: window.currentUser.id }
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  }
  else {
    store = configureStore();
  }


  window.logout = logout;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  

  ReactDOM.render(
    <Root store={store} />,
    root
  );
});
