import * as React from 'react';
import { Table, TableHead, TableRow, TableCell } from 'react'
import Bancos from "../../components/bancos";


function TodosBancos({ data }) {
    return (
           <div>
               <Bancos data={data}></Bancos>
           </div>
    );
}

export async function getStaticProps()
{
    const bancos = await fetch('http://localhost:3000/api/v1/bancos')
    const data = await bancos.json()

    return {
        props: {
            data
        }
    }
}

export default TodosBancos