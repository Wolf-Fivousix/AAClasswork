import { connect } from "react-redux";
import SessionForm from "./session_form";
import { loginUser } from "../../actions/session_actions";

const mapStateToProps = (state, ownProps) => {
  return ({
  errors: state.errors,
  formType: "login"
})};

const mapDispatchToProps = (dispatch, ownProps) => {
  return ({
  processForm: () => dispatch(loginUser())
})};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);