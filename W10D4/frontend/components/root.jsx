import React from "react";
import { Provider } from "react-redux";
import App from "./app";

// Why no Curlies for this Root Arrow Function.
const Root = ({ store }) => (
    <Provider store={store}>
      <App />
    </Provider>
);


export default Root;
// const Root2 = function () (
//   console.log("hi");
// );