import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import { Route, Link, Switch } from "react-router-dom";
import SignupFormContainer from "./greeting/signup_form_container";
import LoginFormContainer from "./greeting/login_form_container";
import { AuthRoute } from "../util/route_util";

const App = () => (
  <div>
    <header>
      <h1><Link to="/">Bench BnB</Link></h1>
      <Switch>
        <AuthRoute exact path="/login" component={LoginFormContainer}/>
        <AuthRoute exact path="/signup" component={SignupFormContainer}/>
        <Route path="/" component={GreetingContainer}/>
      </Switch>
    </header>
  </div>
);

export default App;