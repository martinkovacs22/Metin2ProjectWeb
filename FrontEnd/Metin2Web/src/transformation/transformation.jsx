import React, { useEffect } from "react";
import dataHandler from "./../config/http.js";

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
    useEffect(() => {
        const body = document.body;
        const from = localStorage.getItem("language") || "eng";

        const state = { from, to, components };
        console.log(state);
        dataHandler.postDataAndHandle("change", state).then(res => {
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
    }, [to, components]);

    return null; // As it does not render anything
};

export default Transformation;
