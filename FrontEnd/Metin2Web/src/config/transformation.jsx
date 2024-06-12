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
    const [isSetLanguage, setIsSetLanguage] = useState(false);
    const [initialLanguage, setInitialLanguage] = useState("eng");
    
    useEffect(() => {
        const body = document.body;
        localStorage.setItem("baseLanguage", "eng");

        const baseLanguage = localStorage.getItem("baseLanguage") || "eng";

        

        let fromLanguage = isSetLanguage && (initialLanguage !== localStorage.getItem("language")) ? initialLanguage : baseLanguage;

        const state = { from: fromLanguage, to: to, components: components };
        console.log(state);

        dataHandler.postDataAndHandle("change", state).then(res => {
            console.log(res);
            if (!res.err) {
                setInitialLanguage(to)
                localStorage.setItem("language",to)
                if (!isSetLanguage) {
                    setIsSetLanguage(true);
                }
                
            }
            components.forEach(component => {
                replaceTextRecursively(body, res.data.from[component], res.data.to[component]);
            });
        }).catch(err => {
            console.log(err);
        });

        // Cleanup function if needed
        return () => {
            // Do any cleanup if necessary
        };
    }, [to, components, isSetLanguage,localStorage.getItem("language")]);

    return null; // As it does not render anything
};

export default Transformation;
