import React from "react";
import uniqueId from "../../util/unique_id";

export default class TodoForm extends React.Component{ 
  
  constructor(props){
    super(props);
    this.state = {
      id: uniqueId(),
      title: "",
      body: "",
      done: false
    };
    this.handleTitle = this.handleTitle.bind(this);
  }

  handleTitle(e){
    this.setState({title: e.target.value});
  }
  handle(e) {
    this.setState({ title: e.target.value });
  }

  render(){
    return (
      <form>
        <label>Title
          <input type="text" value={this.state.title} onChange={this.handleTitle}/>
        </label>
        <label>Body
          <input type="text" value={this.state.body} />
        </label>
        <label>Done?
          <input type="checkbox" />
        </label>
        <input type="submit" value="Submit"/>
      </form>
    );
  }
}