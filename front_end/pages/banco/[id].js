import * as React from 'react';
import Banco from "../../components/bancos/banco";


function BancoInfo({ banco }) {
    return (
        <Banco banco={banco}/>
    );
}

export async function getServerSideProps({ query })
{
    const res = await fetch(`http://web:3000/api/v1/banco/${query.id}`)
    const banco = await res.json()


    return {
        props: {
            banco
        }
    }
}



export default BancoInfo