import React, { useEffect, useState } from "react";
import Transformation from "./config/transformation.jsx";
import Home from "./home/home.jsx";
import "./index.css";
import "./base.css";

function App() {
  const [components, setComponents] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const handleLoad = () => {
      setIsLoading(false); // A betöltés befejeződött
    };

    window.addEventListener("load", handleLoad);

    return () => {
      window.removeEventListener("load", handleLoad);
    };
  }, []);

  const addComponentToTransformation = ({ adderComponents }) => {
    if (Array.isArray(adderComponents)) {
      adderComponents.forEach(element => {
        if (!components.includes(element)) {
          setComponents(prevComponents => [...prevComponents, element]);
        }
      });
    }
  };

  return (
    <div >
      
          <Home addComponentToTransformation={addComponentToTransformation} />
          <Transformation to={"hun"} components={components} />
     
 
    </div>
  );
}

export default App;
