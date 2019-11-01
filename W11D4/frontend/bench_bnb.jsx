import React from "react";
import ReactDOM from "react-dom";
import {
  signUp,
  login,
  logout
} from "./util/session_api_util";
import configureStore from "./store/store";
import Root from "./components/root";

import { loginUser } from "./actions/session_actions";

window.signUp = signUp;
window.login = login;
window.logout = logout;

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  
  window.loginUser = loginUser;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  
  
  ReactDOM.render(
    <Root store={store} />,
    root
  );
});
