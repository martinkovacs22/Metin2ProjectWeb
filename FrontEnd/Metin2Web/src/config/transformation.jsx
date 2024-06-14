import React, { useEffect, useState } from "react";
import dataHandler from "./http.js";

function replaceTextRecursively(element, from, to) {
    if (!element) return;
    if (element.nodeType === Node.TEXT_NODE) {
        from.forEach((fromText, index) => {
            const toText = to[index];
            element.textContent = element.textContent.replace(new RegExp(fromText, 'g'), toText);
        });
    }
    element.childNodes.forEach(child => {
        replaceTextRecursively(child, from, to);
    });
}

const Transformation = ({ to, components }) => {
    const [firstChange, setFirstChange] = useState(false);

    
    useEffect(() => {
        const body = document.body;
        localStorage.setItem("baseLanguage", "eng");

        const baseLanguage = localStorage.getItem("baseLanguage") || "eng";
        const state = {
            to: null,
            from: null,
            components: null
        };
        const changeLanguage = async (fromLang, toLang) => {
            state.from = fromLang;
            state.to = toLang;
            state.components = components;
            if (fromLang && toLang && Array.isArray(state.components) && state.components.lenght !== 0) {
                console.log(state);
            
            try {
                const res = await dataHandler.postDataAndHandle("change", state);
                console.log("Response from dataHandler:", res);

                if (res && res.data && res.data.from && res.data.to) {
                    components.forEach(component => {
                        console.log(`Replacing text for component: ${component}`);
                        console.log(`From: ${res.data.from[component]}`);
                        console.log(`To: ${res.data.to[component]}`);
                        replaceTextRecursively(body, res.data.from[component], res.data.to[component]);
                    });
                    localStorage.setItem("language", toLang);
                } else {
                    console.error("Invalid response structure:", res);
                }
            } catch (err) {
                console.log("Error during language change:", err);
            }
            }
        };

        if (localStorage.getItem("language") == null) {
            
            localStorage.setItem("language","eng")

        }

        if (baseLanguage !== localStorage.getItem("language") && !firstChange ) {
            changeLanguage("eng",localStorage.getItem("language")).then(()=>{setFirstChange(true)})
        }
        else if(localStorage.getItem("language") !== to){
            changeLanguage(localStorage.getItem("language"),to).then(()=>{setFirstChange(true)})
        }

        

        // Cleanup function if needed
        return () => {
            // Do any cleanup if necessary
        };
    }, [to, components, firstChange,localStorage.getItem("language")]);

    return null; // As it does not render anything
};

export default Transformation;
