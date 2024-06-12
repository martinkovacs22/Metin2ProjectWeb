import React, { useEffect, useState } from "react";
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Transformation from "./config/transformation.jsx";
import Home from "./component/home/home.jsx";
import NF from "./component/404NF/404NF.jsx"

import "./index.css";
import "./base.css";

function App() {
  const [components, setComponents] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [language, setLanguage] = useState(localStorage.getItem("language") || "eng");

  useEffect(() => {
    const handleLoad = () => {
      setIsLoading(false); // A betöltés befejeződött
    };

    window.addEventListener("load", handleLoad);

    return () => {
      window.removeEventListener("load", handleLoad);
    };
  }, [language]);

  const handlerLanguage =({language})=>{
    setLanguage(language)

  }

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
      <Router>

<Routes>
    <Route exact path='/' element={ <Home addComponentToTransformation={addComponentToTransformation} sideN={handlerLanguage} />}></Route>
    <Route path="*" element={<NF addComponentToTransformation={addComponentToTransformation}></NF>}></Route>
</Routes>

</Router>
         
          <Transformation to={language} components={components} />
     
 
    </div>
  );
}

export default App;
