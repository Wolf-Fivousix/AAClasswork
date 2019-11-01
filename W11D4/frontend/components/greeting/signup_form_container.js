import { connect } from "react-redux";
import SessionForm from "./session_form";
import { signupUser } from "../../actions/session_actions";

const mapStateToProps = (state, ownProps) => ({
  errors: state.errors,
  formType: "signup"
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: () => dispatch(signupUser())
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);