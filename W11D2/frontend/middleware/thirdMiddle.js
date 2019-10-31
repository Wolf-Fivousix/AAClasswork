const ourThirdMiddleware = (store) => (next) => (action) => {
  console.log("Third Middleware");
  return next(action);
};

export default ourThirdMiddleware;