import { connect } from "react-redux";
import Signup from "./signup";
import {
  createNewUser,
  login,
  logout
} from "../../actions/session";

const mapStateToProps = (state) => ({
  // SignUp doesn't need any information to be displayed, therefore no state needs to be connected along.
});

const mapDispatchToProps = (dispatch) => ({
  createNewUser: (payload) => dispatch(createNewUser(payload)),
  // login: () => dispatch(login()),
  // logout: () => dispatch(logout())
});

export default connect(mapStateToProps, mapDispatchToProps)(Signup);