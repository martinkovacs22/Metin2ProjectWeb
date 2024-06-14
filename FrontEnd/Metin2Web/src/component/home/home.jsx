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
        <SideNavbar addComponentToTransformation={addComponentToTransformation} sideN={sideN} />
        <div className="home-background  w-[90vw] ml-[10vw] overscroll-none">
            
            <div className=" w-[90vw] h-auto bg-brown-light overflow-auto py-[2rem]">
            <div className="grid grid-cols-1 justify-center items-center">
        <div className="w-[90vw] text-center grid justify-center items-top" > 
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
