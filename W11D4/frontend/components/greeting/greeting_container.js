import { connect } from "react-redux";
import Greeting from "./greeting";
import { logoutUser } from "../../actions/session_actions";

const mapStateToProps = (state) => {
  return ({
  currentUser: state.entities.users[state.session.currentUser]
})};

// const mapStateToProps = ({ entities: {users}, session: {id} }) => {
//   debugger;
//   return ({
//   currentUser: users[id]
// })};


const mapDispatchToProps = (dispatch) => {
  return ({
  logOut: () => dispatch(logoutUser())
})};

export default connect(mapStateToProps, mapDispatchToProps)(Greeting);