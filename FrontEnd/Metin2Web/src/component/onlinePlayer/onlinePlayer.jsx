import React, { useEffect, useState } from "react";
import dataHandler from "../../config/http";

export default function OnlinePlayer() {
    const [card, setCard] = useState([]);

    const handlerAddSchemaToCard = (data) => {
        setCard((prevComponents) => {
            if (!prevComponents.some(e => e.title === data.title)) {
                return [...prevComponents, data];
            }
            return prevComponents;
        });
    }

    const handlerCardArray = async () => {
        const fetchAndHandleData = async () => {
            const endpoints = [
                { endpoint: "getOnlinePlayerNumber", title: "Online Player" },
                { endpoint: "getLastDayOnlinePlayer", title: "Last Day Online Player" },
                { endpoint: "getAllAccount", title: "Account Number" },
                { endpoint: "getAllCharacter", title: "Character Number" }
            ];

            for (const { endpoint, title } of endpoints) {
                try {
                    const result = await dataHandler.postDataAndHandle(endpoint, {});
                    if (!result.err) {
                        const schema = { title, num: result.data[0]?.result ?? result.data.length ?? 0 };
                        handlerAddSchemaToCard(schema);
                    }
                } catch (error) {
                    console.error(`Error fetching data from ${endpoint}:`, error);
                }
            }
        }

        fetchAndHandleData();
    }

    useEffect(() => {
        handlerCardArray().then(()=>{
            console.log("Le futott");
        })
    }, []);

    return (<div className="flex justify-start items-center">
        <div className="w-[90vw] text-center md:flex justify-center grid md:grid-cols-1 items-top text-5xl">
            {Array.isArray(card) ? card.map((item, index) => (
                <div
                    className=" justify-center items-center grid grid-cols-1 md:w-[15vw] w-[100%] mb-4 h-[20vh] bg-brown opacity-95 rounded shadow-lg shadow-black mx-[3vw]"
                    key={item.title + index}
                >
                    <div className="text-center text-xl text-white">{item.title}</div>
                    <div className="text-center text-3xl text-white">{item.num}</div>
                </div>
            )) : "Some error"}
        </div>
        </div>
    )
}
