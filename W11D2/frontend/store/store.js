import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import logger from 'redux-logger';
import thunk from "../middleware/thunk";
import ourThirdMiddleware from "../middleware/thirdMiddle";
const configureStore = () => createStore(rootReducer, applyMiddleware(logger, thunk));

export default configureStore;