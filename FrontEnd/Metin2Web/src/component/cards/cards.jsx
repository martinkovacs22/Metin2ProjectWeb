import React, { useEffect } from "react";

function Card({title,text,src,isRevert = true}) {
    return (<>

{isRevert ? <div className="lg:flex grid justify-center items-center my-[1rem] bg-brown-light w-[90vw] py-[30px]" key={isRevert+title}>
    <div className="w-[50vw] lg:w-[30vw] flex lg:mx-[1.5vw] lg:my-[0px] my-4 justify-center  lg:justify-start items-center">
            <div className="bg-white  w-[100%] h-[50vh] shadow-lg shadow-black rounded">
                <h1 className="lg:text-3xl text-xl text-brown underline">{title}</h1>
                <div className="text-xl text-brown  text-wrap max-w-[100%]">
                {text}
                </div>
            </div>
        </div>
        <div className="w-[50vw] lg:w-[30vw] flex lg:mx-[1.5vw] lg:my-[0px] my-4 justify-center  lg:justify-start items-center"><img className="h-[50vh] shadow-lg shadow-black" src={src} /></div>

        </div>
        :
        <div className="lg:flex grid justify-center items-center my-[1rem] bg-brown-light w-[90vw] py-[30px]" key={isRevert+title}>
        <div className="w-[50vw] lg:w-[30vw] flex lg:mx-[1.5vw] lg:my-[0px] my-4 justify-center  lg:justify-start items-center"><img className="h-[50vh] shadow-lg shadow-black" src={src} /></div>
        
        <div className="w-[50vw] lg:w-[30vw] flex lg:mx-[1.5vw] lg:my-[0px] my-4 justify-center  lg:justify-start items-center">
            <div className="bg-white  w-[100%] h-[50vh] shadow-lg shadow-black rounded">
                <h1 className="lg:text-3xl text-xl text-brown underline">{title}</h1>
                <div className="text-xl text-brown  text-wrap max-w-[100%]">
                {text}
                </div>
            </div>
        </div>
        </div>
        }
    </>)
}

export default function cardManager() {
    
    const state = [{
        title:"Invite your friends to receive a gift",
        text:"Lorem I can Feel say to me another card gift a second Lorem few fall the hell",
        src:"https://finombanan.v4y.hu/icon.png"
    },{
        title:"Invite your friends to receive a gift",
        text:"Lorem I can Feel say to me another card gift a second Lorem few fall the hell",
        src:"https://finombanan.v4y.hu/icon.png"
    },{
        title:"Invite your friends to receive a gift",
        text:"Lorem I can Feel say to me another card gift a second Lorem few fall the hell",
        src:"https://finombanan.v4y.hu/icon.png"
    }]

    useEffect(()=>{
        console.log("onlinePlayer");
    },[])

    return (<div className="w-[90vw] text-center  grid  justify-center items-top text-5xl mt-10" key={''}>

        {Array.isArray(state) && state.map((item,index)=>{
            return <Card title={item.title} text={item.text} src={item.src} isRevert={index % 2 ==0}/>
        })}
        
    </div>)

}