import React, { useEffect } from "react";

import SideNavbar from "../SideNavbar/sideNavbar.jsx"

export default function Home({addComponentToTransformation,sideN}) {
    
    useEffect(()=>{
        console.log("HOME");
        addComponentToTransformation({adderComponents:["navbar"]});
    },[])

    return(<div>
        <SideNavbar addComponentToTransformation={addComponentToTransformation} sideN={sideN}/>
        
    </div>)

}