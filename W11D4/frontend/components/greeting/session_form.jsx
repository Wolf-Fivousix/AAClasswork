import React from "react";

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
    debugger;
    this.props.processForm(user);
  }

  render() {
    const formButton = (this.formType === "signup") ?
      ("Sign Up") : ("Log In");

    return (
      <div>
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