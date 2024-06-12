import React, { useEffect } from "react";

export default function NF({addComponentToTransformation}) {
    useEffect(()=>{
        addComponentToTransformation({adderComponents:["NF"]});
        setTimeout(()=>{
            window.location.href ="/"
        },5000)
    },[])

    return(<div>
        <h1 className="p-4 font-bold text-5xl">
         404 NOT FOUND PAGE  
        </h1>
        <h3 className="p-4 font-bold text-2xl">Few second change page to home</h3>
        
    </div>)

}
