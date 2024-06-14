import React, { useEffect } from "react";



export default function OnlinePlayer({}) {
    
    useEffect(()=>{
        console.log("onlinePlayer");
    },[])

    return (<div className="w-[100vw] text-center flex justify-center items-top text-5xl">
        <div className="md:flex justify-center items-center grid grid-cols-1 w-[15vw] h-[20vh] bg-brown opacity-95 rounded shadow-lg shadow-black mx-[3vw]"></div>
        <div className="md:flex justify-center items-center grid grid-cols-1 w-[15vw] h-[20vh] bg-brown opacity-95 rounded shadow-lg shadow-black mx-[3vw]"></div>
        <div className="md:flex justify-center items-center grid grid-cols-1 w-[15vw] h-[20vh] bg-brown opacity-95 rounded shadow-lg shadow-black mx-[3vw]"></div>
        <div className="md:flex justify-center items-center grid grid-cols-1 w-[15vw] h-[20vh] bg-brown opacity-95 rounded shadow-lg shadow-black mx-[3vw]"></div>
    </div>)

}