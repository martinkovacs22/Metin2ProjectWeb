import React from "react";

import dc from "../../assets/discord.png"

export default function Discord(params) {
    
    return(
        <div className="fixed bottom-1 right-2 w-[4vw] h-[4vw] mx-[3vw] my-[3vh] p-[5px] bg-brown  rounded-full shadow-md  shadow-white flex justify-center items-center hover:bg-white">
            <img src={dc} />
        </div>
    )

}