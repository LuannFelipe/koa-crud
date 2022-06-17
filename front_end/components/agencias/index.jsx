import Link from 'next/link'
import { useRouter } from 'next/router'
import usaAgencia from "../hooks/agencias/usaAgencia";
import {useEffect, useState} from "react";

const Agencia= ({ bancos }) => {
    const router = useRouter()

    const {agencia, fetchAgencias} = usaAgencia(20)

    const [deletou, setDeletou] = useState(0)

    const [pagina, setPagina] = useState(1)


    useEffect(()=>{
        if(pagina <= 0)
        {
            setPagina(1)
        }else {
            fetchAgencias(pagina)
        }

    },[pagina])

    useEffect(()=>{
        if(deletou === 1) {
            fetchAgencias(pagina)
            setDeletou(0)
        }
    },[deletou])


    useEffect(()=>{
        fetchAgencias(1)
    },[])

    return (
        <>
            <div>
                <div>
                    <h1 className="text-center mb-5 text-secondary">Agencias</h1>
                </div>
                <div className="d-flex justify-content-between mb-2">
                    <Link href='/agencia/cadastrar'><input type="button" value="adicionar" className="btn bg-secondary bg-opacity-25" /></Link>
                    <div className="d-flex">
                        <input type="button" value="<" onClick={()=>setPagina(pagina-1)} className="border-0 bg-transparent"/>
                        <div className="mx-3">{pagina}</div>
                        <input type="button" value=">" onClick={()=>setPagina(pagina+1)} className="border-0 bg-transparent"/>
                    </div>
                    <div>
                        <label>procurar: <input type="text" placeholder="id" id="id" className="mx-1"/></label>
                        <input type="button" value="ver" className="btn bg-secondary bg-opacity-25" onClick={() => {
                            const id = pegarId()
                            const existe = verificarId(id, agencias)

                            if(existe)
                                router.push(`/agencia/${id}`)
                            else
                                window.alert("id não existe")
                        }}/>
                    </div>
                </div>
            </div>
            <div className="responsive-table">
                <table className="table table-sm table-striped caption-top" >
                    <caption>Lista de Agências</caption>
                    <thead className="table-dark ">
                    <tr>
                        <th className="text-left">#</th>
                        <th className="text-left">nome</th>
                        <th className="text-center">banco</th>
                        <th className="text-center">fone</th>
                        <th className="text-center">fone1</th>
                        <th className="text-center">endereço</th>
                        <th className="text-center">agencia</th>
                        <th className="text-center"></th>
                    </tr>
                    </thead>
                    <tbody className="bg-secondary bg-opacity-25">
                    { agencia.map((agencia) => {
                        return (
                            <tr key={agencia}>
                                <td className="text-center">{agencia.id}</td>
                                <td className="text-center">{agencia.nome_agencia}</td>
                                <td className="text-center">{nomeBanco(bancos, agencia.id_banco)}</td>
                                <td className="text-center">{agencia.fone == null ? <>vazio</> : agencia.fone}</td>
                                <td className="text-center">{agencia.fone1 == null ? <>vazio</> : agencia.fone1}</td>
                                <td className="text-center">{agencia.endereco}</td>
                                <td className="text-center">{agencia.agencia === "" ? <>vazio</> : agencia.agencia}</td>
                                <td key={agencia.id}>
                                    <input type="button" value="ver" className="btn bg-opacity-25 bg-secondary me-2" onClick={() => {
                                        router.push(`/agencia/${agencia.id}`)
                                    }}/>
                                    <input type="button" value="remover" className="btn bg-secondary bg-opacity-25" onClick={() => {
                                        deletar(agencia.id)
                                        setDeletou(1)
                                        alert("agencia deletada")
                                        //router.reload(window.location.pathname)
                                    }}/></td>
                            </tr>
                        );
                    })}
                    </tbody>
                </table>
            </div>
        </>
    );
};

function nomeBanco( banco , id)
{
    for (const bancoElement of banco) {
        if(bancoElement.id === id)
        {
            return bancoElement.nome
        }
    }
}

async function deletar(id)
{
    console.log("DASdASDDS")
    const res = await fetch(`http://localhost:3000/api/v1/deletarAgencia/${id}`,{
        method: 'delete'
    })
    const resposta = await res.json()

}

function pegarId(){
    var text = document.getElementById('id')
    return text.value
}

function verificarId(id,data)
{
    for (const agencia of data) {
        if(id == agencia.id)
            return true
    }

    return false
}

export default Agencia;