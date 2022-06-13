import Link from 'next/link'
import { useRouter } from 'next/router'
import {useEffect, useState} from "react";
import useBancos from "../hooks/bancos/usaBancos";
import {wait} from "next/dist/build/output/log";
import {usePagination} from "react-use-pagination";

const Bancos= ({ data}) => {
    const { feachtBancos, bancos } = useBancos(20)

    useEffect(() => {
       feachtBancos(1)
    },[])

   const [pagina, setPagina] = useState(1)

    useEffect(()=>{
        if(pagina <= 0)
            setPagina(1)
        feachtBancos(pagina)
    },[pagina])

    const router = useRouter()
    return(
        <>
            <div>
                <div>
                    <h1 className="text-center mb-5 text-secondary">Bancos</h1>
                </div>
                <div className="d-flex justify-content-between mb-2">
                    <Link href='/banco/cadastrar'><input type="button" value="adicionar" className="btn bg-opacity-25 bg-secondary"/></Link>
                    <div className="d-flex">
                        <input type="button" value="<" onClick={()=>setPagina(pagina-1)} className="border-0 bg-transparent"/>
                        <div className="mx-3">{pagina}</div>
                        <input type="button" value=">" onClick={()=>setPagina(pagina+1)} className="border-0 bg-transparent"/>
                    </div>
                    <div>

                        <label>procurar: <input type="text" placeholder="id" id="id" className="mx-1"/></label>
                        <input type="button" value="ver" className="btn bg-opacity-25 bg-secondary" onClick={() => {
                            const id = pegarId()
                            const existe = verificarId(id, data)

                            if(existe)
                                router.push(`/banco/${id}`)
                            else
                                window.alert("id não existe")
                        }}/>
                    </div>
                </div>
            </div>



            <div>
                <table className="table table-striped table-sm caption-top table-responsive">
                    <caption>lista de bancos</caption>
                    <thead className="table-dark" >
                    <tr>
                        <th className="text-center">#</th>
                        <th className="text-center">nome</th>
                        <th className="text-center">numero</th>
                        <th className="text-center">ispd</th>
                        <th className="text-center"></th>
                    </tr>
                    </thead>
                    <tbody className="bg-secondary bg-opacity-25">
                    {bancos.map((banco) => {
                        return (
                            <tr key={banco.id}>
                                <td className="text-center">{banco.id}</td>
                                <td className="text-center">{banco.nome}</td>
                                <td className="text-center">{banco.numero === '' ? <>vazio</> : banco.numero}</td>
                                <td className="text-center">{banco.ispd == null ? <>vazio</> : banco.ispd}</td>
                                <td key={banco.id}>
                                    <input type="button" value="ver" className="btn bg-opacity-25 bg-secondary me-2" onClick={() => {
                                        router.push(`/banco/${banco.id}`)
                                    }}/>
                                    <input type="button" value="remover" className="btn bg-opacity-25 bg-secondary" onClick={ () => {

                                        deletar(banco.id)


                                        //router.reload(window.location.pathname)
                                    }}/>

                                </td>
                            </tr>
                        );
                    })}
                    </tbody>
                </table>
            </div>

        </>

    );
};



async function deletar(id)
{

    const res = await fetch(`http://localhost:3000/api/v1/deletar/${id}`,{
        method: 'DELETE'
    })
    const resposta = await res.json()
}

function pegarId(){
    var text = document.getElementById('id')
    return text.value
}

function verificarId(id,data)
{
    for (const banco of data) {
        if(id == banco.id)
            return true
    }

    return false
}


export default Bancos;