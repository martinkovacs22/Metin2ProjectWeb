import React, { useEffect } from "react";

export default function NF({addComponentToTransformation}) {
    useEffect(()=>{
        addComponentToTransformation({adderComponents:["NF"]});
        setTimeout(()=>{
            window.location.href ="/"
        },5000)
    },[])

    return(<div className="bg-red-500">
        <h1 className="p-4 font-bold text-5xl">
        404 Not found the page
        </h1>
        <h3 className="p-4 font-bold text-2xl">Few secod change page to home</h3>
        
    </div>)

}
