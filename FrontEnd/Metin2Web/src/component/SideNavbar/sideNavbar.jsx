import React,{useEffect, useState} from "react";

export default function SideNavbar({addComponentToTransformation}) {
    const [isOpen,setIsOpen] = useState(false);
    useEffect(()=>{
        addComponentToTransformation({adderComponents:["phpSignup"]});
        setIsOpen(true)
    },[])
    return(<div>
        <div id="sideNavbar" className={`fixed  h-[100vh] bg-white border-2 border-separate border-black ${isOpen ? 'w-[30vw]' : 'w-[10vw]'}`}>
                <div className="px-[2vw] py-[2vh] h-[100vh] ">
                    <div className="flex justify-end items-center text-white h-[10vh]">   

                        <div className="p-[5px]" onClick={()=>{setIsOpen(!isOpen)}}><img className="w-[3vw] h-auto" src={isOpen? "https://finombanan.v4y.hu/arrowLeft.png":"https://finombanan.v4y.hu/arrowRight.png"} /></div>
                    </div>
                    <div className="flex justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh]">   
                        <div><img src={`https://finombanan.v4y.hu/${localStorage.getItem("language")}.png`} /></div>
                        <div>{isOpen ?"Language":""}</div>
                        <div>{isOpen ?<img className="rotate-90 w-[2vw] rounded-full border-2 border-spacing border-red-500" src="https://finombanan.v4y.hu/arrowRight.png" />:""}</div>
                    </div>
                    <div className="flex justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh]">   
                        <div>a</div>
                        <div>{isOpen ?"fdsf":""}</div>
                        <div>{isOpen ?"fdsf":""}</div>
                    </div>
                    <div className="flex justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh]">   
                        <div>a</div>
                        <div>{isOpen ?"fdsf":""}</div>
                        <div>{isOpen ?"fdsf":""}</div>
                    </div>
                </div>
            </div>
    </div>)
}