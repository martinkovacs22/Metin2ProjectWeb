import React, { useEffect } from "react";

function card({}) {
    return (<div className="w-[100vw] text-center flex justify-center items-top text-5xl mt-10">

        {isRevert ? <><div className="w-[50vw] flex mx-[3vw] justify-end items-center"><div className="bg-white w-[70%] h-[50vh] shadow-lg shadow-black">Text</div></div>
        
        <div className="w-[50vw] flex mx-[3vw] justify-start items-center"><img className="h-[50vh] shadow-lg shadow-black" src={"https://finombanan.v4y.hu/icon.png"} /></div></>
        :
        <>
        <div className="w-[50vw] flex mx-[3vw] justify-end items-center"><img className="h-[50vh] shadow-lg shadow-black" src={"https://finombanan.v4y.hu/icon.png"} /></div>
        
        <div className="w-[50vw] flex mx-[3vw] justify-start items-center"><div className="bg-white w-[70%] h-[50vh] shadow-lg shadow-black"></div></div>
        </>
        }
    </div>)
}

export default function cardManager({isRevert }) {
    
    const state = []

    useEffect(()=>{
        console.log("onlinePlayer");
    },[])

    return (<div className="w-[100vw] text-center flex justify-center items-top text-5xl mt-10">

        {isRevert ? <><div className="w-[50vw] flex mx-[3vw] justify-end items-center"><div className="bg-white w-[70%] h-[50vh] shadow-lg shadow-black">Text</div></div>
        
        <div className="w-[50vw] flex mx-[3vw] justify-start items-center"><img className="h-[50vh] shadow-lg shadow-black" src={"https://finombanan.v4y.hu/icon.png"} /></div></>
        :
        <>
        <div className="w-[50vw] flex mx-[3vw] justify-end items-center"><img className="h-[50vh] shadow-lg shadow-black" src={"https://finombanan.v4y.hu/icon.png"} /></div>
        
        <div className="w-[50vw] flex mx-[3vw] justify-start items-center">
            <div className="bg-black opacity-90 w-[70%] h-[50vh] shadow-lg shadow-black">
                <h1 className="text-3xl  underline">Title</h1>
                <div className="text-xl  text-wrap max-w-[100%]">
                texttexttexttexttexttexttex ttexttexttexttex ttexttexttex ttexttexttexttex ttexttexttexttext
                </div>
            </div>
        </div>
        </>
        }
    </div>)

}