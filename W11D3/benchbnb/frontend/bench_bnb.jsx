import React from "react";
import ReactDOM from "react-dom";
import {
  signUp,
  login,
  logout
} from "./util/session_api_util";

window.signUp = signUp;
window.login = login;
window.logout = logout;

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
