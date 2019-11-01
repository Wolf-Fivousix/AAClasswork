import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import Route from "react-router-dom";
import SignupFormContainer from "./greeting/signup_form_container";
import LoginFormContainer from "./greeting/login_form_container";


const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

    <SignupFormContainer />
    <LoginFormContainer />

  </div>
);

export default App;