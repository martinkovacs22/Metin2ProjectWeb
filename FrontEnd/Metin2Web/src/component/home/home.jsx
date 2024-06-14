import React, { useEffect } from "react";
import SideNavbar from "../SideNavbar/sideNavbar.jsx";
import OnlinePlayer from "../onlinePlayer/onlinePlayer.jsx"
import Cards from "../cards/cards.jsx"
import "./home.css";

export default function Home({ addComponentToTransformation, sideN }) {

    useEffect(() => {
        console.log("HOME");
        addComponentToTransformation({ adderComponents: ["navbar"] });
    }, [addComponentToTransformation]);

    return (
        <>
        <div className="home-background">
            <SideNavbar addComponentToTransformation={addComponentToTransformation} sideN={sideN} />
            <div className=" w-[100vw] h-[200vh] bg-brown-light overflow-auto">
            <div className="grid grid-cols-1 justify-center items-center">
        <div className="w-[100vw] text-center flex justify-center items-top" > 
            <h1 className="bg-white text-5xl font-black w-min my-[3vh] p-[10px] rounded" >Metin 2 Monster</h1>
        </div>
        
        <OnlinePlayer />
        <Cards />
       </div>
            </div>
            
        </div>
        </>
    );
}
