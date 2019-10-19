const DOMNodeCollection = require("./dom_node_collection.js");

const $l = function (apples) {
  // if (args[0] instanceof HTMLElement) return new DOMNodeCollection(args[0]);
  if (apples instanceof HTMLElement) return new DOMNodeCollection(apples);
  return document.querySelectorAll("html").map((element) => new DOMNodeCollection(element));
};

window.$l = $l;


