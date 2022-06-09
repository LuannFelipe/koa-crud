import * as React from 'react';
import Banco from "../../components/bancos/banco";
import Agencia from "../../components/agencias/agencia";


function BancoInfo({ agencia, banco }) {
    return (
        <Agencia agencia={agencia} banco={banco}/>
    );
}

export async function getServerSideProps({ query })
{
    const res = await fetch(`http://localhost:3000/api/v1/agencia/${query.id}`)
    const agencia = await res.json()

    const resBanco = await fetch(`http://localhost:3000/api/v1/banco/${agencia.id_banco}`)
    const banco = await resBanco.json()



    return {
        props: {
            agencia,
            banco
        }
    }
}

export default BancoInfo