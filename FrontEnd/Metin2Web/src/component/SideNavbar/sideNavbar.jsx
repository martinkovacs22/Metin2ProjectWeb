import React,{useEffect, useState} from "react";
import dataHandler from "../../config/http";

export default function SideNavbar({addComponentToTransformation,sideN}) {
    const [isOpen,setIsOpen] = useState(false);
    const [isOpenLanguage,setIsOpenLanguage] = useState(false);
    const [allLanguage,setAllLanguage] = useState(["hun","eng","por","spa","ger"]);
    
    useEffect(()=>{
        addComponentToTransformation({adderComponents:["phpSignup"]});
        dataHandler.postDataAndHandle("getAllLanguage",{}).then(res=>{
            setAllLanguage(res.data)
        }).catch(err=>{
            console.log(err);
        })
    },[])
    useEffect(()=>{
        if (!isOpen && isOpenLanguage) {
            setIsOpenLanguage(false)
        }
    },[isOpen])
    const handlerLanguage =()=>{
        setIsOpenLanguage(!isOpenLanguage);
    }

    const handlerLanguageChange=({language})=>{
        console.log(language);
        sideN({language:language})
    }
    const handlerIsClose =()=>{
        console.log(isOpen);
        if (!isOpen) {
            setIsOpen(true)
        }
    }

    return(<div>
        <div id="sideNavbar" className={`fixed  h-[100vh] bg-blue-950 ${isOpen ? 'w-[30vw]' : 'w-[10vw]'}`} onClick={()=>{handlerIsClose()}}>
                <div className="px-[2vw] py-[2vh] h-[100vh] ">
                    <div className="flex justify-end items-center text-white h-[10vh]">   

                        <div className="p-[5px]" onClick={()=>{setIsOpen(!isOpen)}}><img className="w-[3vw] h-auto" src={isOpen? "https://finombanan.v4y.hu/arrowLeft.png":"https://finombanan.v4y.hu/arrowRight.png"} /></div>
                    </div>
                    <div onClick={()=>{handlerLanguage()}} className="flex justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh]">   
                        <div ><img src={`https://finombanan.v4y.hu/${localStorage.getItem("language")}.png`} /></div>
                        <div>{isOpen ?"Language":""}</div>
                        <div>{isOpen ?<img className="rotate-90 w-[2vw] rounded-full border-2 border-spacing border-red-500" src="https://finombanan.v4y.hu/arrowRight.png" />:""}</div>
                        
                    </div>
                        <div className={`top-[25vh] absolute h-auto bg-red-400 overflow-auto  max-h-[40vh] ${isOpen ? 'w-[26vw]' : 'w-[6vw]'} ${isOpenLanguage?`grid grid-cols-1`:`hidden`}`}> 
                            {Array.isArray(allLanguage) && allLanguage.map((item,index)=>{
                                
                                return(<div className={`hover:bg-red-300 h-[10vh] flex justify-center items-center ${isOpen ? 'w-[26vw]' : 'w-[6vw]'}`} onClick={()=>{handlerLanguageChange({language:item})}} >
                                    <img src={`https://finombanan.v4y.hu/${item}.png`} />
                                </div>)
                            })}
                            
                        </div>
                    <div className="flex justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh]">   
                        <div>a</div>
                        <div>{isOpen ?"Setting":""}</div>
                        <div>{isOpen ?"fdfdsf":""}</div>
                    </div>
                    <div className="flex justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh]">   
                        <div>a</div>
                        <div>{isOpen ?"About":""}</div>
                        <div>{isOpen ?"fdsf":""}</div>
                    </div>
                </div>
            </div>
    </div>)
}