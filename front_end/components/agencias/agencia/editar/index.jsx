import * as React from "react";
export default function Editar({ banco }){
    return(
        <div>
            <label htmlFor="nome">Nome:</label>
            <input type="text" id="nome" name="nome" placeholder={banco.nome}/>
            <label htmlFor="numero">Numero:</label>
            <input type="text" id="numero" name="numero" placeholder={`${banco.numero}`}/>
            <label htmlFor="ispd">ispd:</label>
            <input type="text" id="ispd" name="ispd" placeholder={banco.ispd}/>
            <button type="button" onClick={() => {
                editar(banco.id)
            }}>editar</button>

        </div>
    )
}

async function editar(id){
    const nome = document.getElementById('nome')
    const numero = document.getElementById('numero')
    const ispd = document.getElementById('ispd')
    const res = await fetch(`http://localhost:3000/api/v1/editarBanco/${id}?nome=${nome.value}&numero=eqwq&ispd=123`, {
        method: 'put',
    })
}

