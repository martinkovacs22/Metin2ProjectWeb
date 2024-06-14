import React,{useEffect, useState} from "react";
import dataHandler from "../../config/http";
import setting from "./../../assets/setting.png"
import about from "./../../assets/about.png"
import links from "./../../assets/link.png"
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
        <div id="sideNavbar" className={`fixed z-50  h-[100vh] bg-brown-linear ${isOpen ? 'sideNavbarCloseToOpen' : 'sideNavbarOpenToClose'}`} onClick={()=>{handlerIsClose()}}>
                <div className="px-[2vw] py-[2vh] h-[100vh] ">
                    <div className="flex route justify-end items-center text-white h-[10vh]">   

                        <div className="p-[5px]" onClick={()=>{setIsOpen(!isOpen)}}><img className=" w-[10vw] md:w-[3.5vw] bg-brown p-2 shadow-lg shadow-black rounded-2xl hover:bg-white  h-auto" src={isOpen? "https://finombanan.v4y.hu/arrowLeft.png":"https://finombanan.v4y.hu/arrowRight.png"} /></div>
                    </div>
                    <div onClick={()=>{handlerLanguage()}} className="md:flex shadow-lg shadow-black grid grid-cols-1 route justify-center md:justify-around items-center bg-white text-black rounded-2xl h-[10vh] my-[5vh] hover:bg-gray-400">   
                        <div className="flex justify-center items-center"><img className="  w-[10vw] md:w-[3.5vw] bg-brown p-2 shadow-lg shadow-black rounded-2xl language" src={`https://finombanan.v4y.hu/${localStorage.getItem("language")}.png`} /></div>
                        <div className={`${isOpen?"flex justify-center items-center":"hidden"}`}>Language</div>
                    </div>
                        <div className={`top-[25vh] absolute  bg-red-400 overflow-y-auto overflow-x-hidden max-h-[40vh] ${isOpen ? 'w-[26vw]' : 'w-[15vw]'} ${isOpenLanguage?`grid grid-cols-1`:`hidden`}`}> 
                            {Array.isArray(allLanguage) && allLanguage.map((item,index)=>{
                                
                                return(<div key={"language"+index} className={`hover:bg-red-300 h-[10vh] flex justify-center items-center ${isOpen ? 'w-[26vw]' : 'w-[15vw]'}`} onClick={()=>{handlerLanguageChange({language:item})}} >
                                    <img className=" w-[10vw] md:w-[3.5vw] bg-brown p-2 shadow-lg shadow-black rounded-2xl  " src={`https://finombanan.v4y.hu/${item}.png`} />
                                </div>)
                            })}
                            
                        </div>
                    <div className="md:flex shadow-lg shadow-black grid grid-cols-1 route justify-center md:justify-around items-center bg-white text-black rounded-2xl h-[10vh] my-[5vh] hover:bg-gray-400">   
                        <div className="flex justify-center items-center"><img className="  w-[10vw] md:w-[3.5vw] bg-brown p-2 shadow-lg shadow-black rounded-2xl  " src={links} /></div>
                        <div className={`${isOpen?"flex justify-center items-center":"hidden"}`}>Links</div>
           
                    </div>
                   
                    <a className="md:flex shadow-lg shadow-black grid grid-cols-1 route justify-center md:justify-around items-center bg-white text-black rounded-2xl h-[10vh] my-[5vh] hover:bg-gray-400" href="/setting">   
                        <div className="flex justify-center items-center"><img className="  w-[10vw] md:w-[3.5vw] bg-brown p-2 shadow-lg shadow-black rounded-2xl  " src={setting} /></div>
                        <div className={`${isOpen?"flex justify-center items-center":"hidden"}`}>Setting</div>
                
                    </a>
                    <a className="md:flex shadow-lg shadow-black grid grid-cols-1 route justify-center md:justify-around items-center bg-white text-black rounded-2xl h-[10vh] my-[5vh] hover:bg-gray-400" href="/about">   
                        <div className="flex justify-center items-center"><img className="  w-[10vw] md:w-[3.5vw] bg-brown p-2 shadow-lg shadow-black rounded-2xl  " src={about} /></div>
                        <div className={`${isOpen?"flex justify-center items-center":"hidden"}`}>About</div>
                 
                    </a>
                </div>
            </div>
    </div>)
}