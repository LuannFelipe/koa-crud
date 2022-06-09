import * as React from 'react';
import Editar from "../../../components/bancos/banco/editar";


function BancoInfo({ banco }) {
    return (
        <Editar banco={banco}/>
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