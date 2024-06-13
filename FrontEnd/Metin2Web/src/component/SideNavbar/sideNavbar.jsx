import React,{useEffect, useState} from "react";
import dataHandler from "../../config/http";
import setting from "./../../assets/setting.png"
import about from "./../../assets/about.png"
import route from "./../../assets/route.png"
export default function SideNavbar({addComponentToTransformation,sideN}) {
    const [isOpen,setIsOpen] = useState(false);
    const [isOpenLanguage,setIsOpenLanguage] = useState(false);
    const [allLanguage,setAllLanguage] = useState();
    
    useEffect(()=>{
        addComponentToTransformation({adderComponents:["phpSignup","navbar"]});
        dataHandler.postDataAndHandle("getAllLanguage",{}).then(res=>{
            setAllLanguage(res.data)
        }).catch(err=>{
            console.log(err);
        })
    },[])
    useEffect(()=>{
        addComponentToTransformation({adderComponents:["phpSignup","navbar"]});
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
        <div id="sideNavbar" className={`fixed  h-[100vh] bg-blue-950 ${isOpen ? 'sideNavbarCloseToOpen' : 'sideNavbarOpenToClose'}`} onClick={()=>{handlerIsClose()}}>
                <div className="px-[2vw] py-[2vh] h-[100vh] ">
                    <div className="flex route justify-end items-center text-white h-[10vh]">   

                        <div className="p-[5px]" onClick={()=>{setIsOpen(!isOpen)}}><img className="icon  h-auto" src={isOpen? "https://finombanan.v4y.hu/arrowLeft.png":"https://finombanan.v4y.hu/arrowRight.png"} /></div>
                    </div>
                    <div onClick={()=>{handlerLanguage()}} className="flex route justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh] hover:bg-gray-400">   
                        <div ><img className="iconlanguage" src={`https://finombanan.v4y.hu/${localStorage.getItem("language")}.png`} /></div>
                        <div className={`${isOpen?"flex":"hidden"}`}>Language</div>
                    </div>
                        <div className={`top-[25vh] absolute  bg-red-400 overflow-y-auto overflow-x-hidden max-h-[40vh] ${isOpen ? 'w-[26vw]' : 'w-[6vw]'} ${isOpenLanguage?`grid grid-cols-1`:`hidden`}`}> 
                            {Array.isArray(allLanguage) && allLanguage.map((item,index)=>{
                                
                                return(<div key={"language"+index} className={`hover:bg-red-300 h-[10vh] flex justify-center items-center ${isOpen ? 'w-[26vw]' : 'w-[6vw]'}`} onClick={()=>{handlerLanguageChange({language:item})}} >
                                    <img className="icon " src={`https://finombanan.v4y.hu/${item}.png`} />
                                </div>)
                            })}
                            
                        </div>
                    <div className="flex route justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh] hover:bg-gray-400">   
                        <div><img className="icon " src={route} /></div>
                        <div className={`${isOpen?"flex":"hidden"}`}>Links</div>
           
                    </div>
                   
                    <a className="flex route justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh] hover:bg-gray-400" href="/setting">   
                        <div><img className="icon " src={setting} /></div>
                        <div className={`${isOpen?"flex":"hidden"}`}>About</div>
                
                    </a>
                    <a className="flex route justify-around items-center bg-gray-600 text-white h-[10vh] my-[5vh] hover:bg-gray-400" href="/about">   
                        <div><img className="icon " src={about} /></div>
                        <div className={`${isOpen?"flex":"hidden"}`}>About</div>
                 
                    </a>
                </div>
            </div>
    </div>)
}