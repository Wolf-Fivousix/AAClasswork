import React from "react";
import { Route, withRouter, Redirect } from "react-router-dom";
import { connect } from "react-redux";

const Auth = ({ component: Component, path, loggedIn, exact }) => {
  // debugger;
  return (<Route
    path={path}
    exact={exact}
    render={props =>
      loggedIn ? <Redirect to="/" /> : <Component {...props} />
    }
  />
)};

const mapStateToProps = state => {
  // debugger;
  return { loggedIn: Boolean(state.session.currentUser) };
};

export const AuthRoute = withRouter(connect(mapStateToProps,null)(Auth));