import React from "react";
import Transformation from "./transformation/transformation.jsx";
import Home from "./home/index.jsx";

function App() {
  return (
    <>
      <Home />
      <Transformation to={"hun"} components={["navbar"]} />
    </>
  );
}

export default App;
