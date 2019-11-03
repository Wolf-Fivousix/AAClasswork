import React from "react";
import { Link } from "react-router-dom"; 

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(type) {
    return (e) => {
      this.setState( {[type]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user)
      .then(() => this.props.history.push("/"));
  }

  render() {
    let instructions = "instructions";
    let formButton = "formButton";
    let move = "move"
    if (this.props.formType === "signup"){
      instructions = "Sign Up Now! =)"
      formButton = "Sign Up";
      move = <Link to="/login">Log In</Link>;
    }
    else {
      instructions = "What you waiting for? Log in Human!";
      formButton = "Log In";
      move = <Link to="/signup">Sign Up</Link>;
    }
    
    const errors = this.props.errors.session.errors || "";

    return (
      <div>
        <h4>{move}</h4>
        <h3>{instructions}</h3>
        <h2>{errors}</h2>
        <form onSubmit={this.handleSubmit}>
          <label>Username:
            <input
              type="text"
              value={this.state.username}
              onChange={this.handleInput("username")}
            />
          </label>
          <label>Password:
            <input
              type="text"
              value={this.state.password}
              onChange={this.handleInput("password")}
            />
          </label>
          
          <button>
            {formButton}
          </button>
        </form>
      </div>
    );
  }
}
export default SessionForm;