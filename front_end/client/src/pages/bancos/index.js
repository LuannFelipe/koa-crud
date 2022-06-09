import React, { useState, useEffect } from "react";
import {getBancos} from "../../dados";


export default function BancosInfo() {
    const [bancos, setTopics] = useState([]);

    useEffect(() => {
        getBancos().then((res) => setTopics([...bancos, res.data]));
    }, []);
    console.log(bancos)
    return (
        <>
            <table>
                <thead>
                <tr>
                    <th>id</th>
                    <th>nome</th>
                    <th>numero</th>
                    <th>ispd</th>
                </tr>
                </thead>
                <tbody>
                {bancos.map((banco) =>
                    banco.map((item) =>
                        <tr>
                            <td>{item.id}</td>
                            <td>{item.nome}</td>
                            <td>{item.numero}</td>
                            <td>{item.ispd}</td>
                        </tr>
                    ))
                }
                </tbody>
            </table>
        </>
    );
}