import React, { useState } from "react";
import Transformation from "./config/transformation.jsx";
import Home from "./home/home.jsx";
import "./index.css"
import "./base.css"

function App() {

  const [components,setComponents] = useState([]);

  const addComponentToTransformation = ({ adderComponents }) => {
    if (Array.isArray(adderComponents)) {
      adderComponents.forEach(element => {
        if (!components.includes(element)) {
          setComponents(prevComponents => [...prevComponents, element]);
        }
      });
    }

  }

  return (
    <>
      <Home addComponentToTransformation={addComponentToTransformation} />
      <Transformation to={"hun"} components={components} />
    </>
  );
}

export default App;
