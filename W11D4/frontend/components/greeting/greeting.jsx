import React from "react";
import { Link } from "react-router-dom";
import SessionForm from "./session_form";

const Greeting = ({ currentUser, logOut }) => {
  const somethinggg = currentUser ? (
    <div>
      <h3>Welcome, {currentUser.username}</h3>
      <button onClick={ logOut }>
        Log Out Now
      </button>
    </div>
  ) : (
    <div>
      <Link to="/signup">Sign Up</Link>
      <Link to="/login">Log In</Link>
    </div>
    );

  return (
    <div>
      {somethinggg}
    </div>
  );
}

export default Greeting;