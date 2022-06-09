import Link from 'next/link'
import { useRouter } from 'next/router'
import Image from "next/image";

const Bancos= ({ data }) => {
    const router = useRouter()
    return (
        <>

            <div>
                <div>
                    <h1 className="text-center mb-5 text-secondary">Bancos</h1>
                </div>
                <div className="d-flex justify-content-between mb-2">
                    <Link href='/banco/cadastrar'><input type="button" value="adicionar" className="btn bg-opacity-25 bg-secondary"/></Link>
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
                <table className="table table-striped table-sm caption-top ">
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
                    {data.map((banco) => {
                        return (
                            <tr key={banco.id}>
                                <td className="text-center">{banco.id}</td>
                                <td className="text-center">{banco.nome}</td>
                                <td className="text-center">{banco.numero === '' ? <>vazio</> : banco.numero}</td>
                                <td className="text-center">{banco.ispd == null ? <>vazio</> : banco.ispd}</td>
                                <td key={banco.id}>
                                    <button type="button" className="btn bg-opacity-25 bg-secondary me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        Ver
                                    </button>

                                    <div className="modal fade" id="exampleModal" tabIndex="-1" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true" key={banco.id}>
                                        <div className="modal-dialog">
                                            <div className="modal-content">
                                                <div className="modal-header">
                                                    <h5 className="modal-title" id="exampleModalLabel">{banco.nome} <Image src="/img/diamond.png" width={24} height={24} layout={"fixed"}/> </h5>
                                                    <button type="button" className="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div className="modal-body">
                                                    <p><strong>Id: </strong>{banco.id}</p>
                                                    <p><strong>Nome: </strong>{banco.nome}</p>
                                                    <p><strong>Numero: </strong>{banco.numero === '' ? <>vazio</> : banco.numero}</p>
                                                    <p><strong>Ispd: </strong>{banco.ispd == null ? <>vazio</> : banco.ispd}</p>
                                                </div>
                                                <div className="modal-footer">
                                                    <button type="button" className="btn bg-black text-white" data-bs-dismiss="modal">Fechar</button>
                                                    <button type="button" className="btn bg-black text-white w-auto" data-bs-dismiss="modal" onClick={() => {
                                                        console.log(banco.id)
                                                    }}>Remover</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="button" value="remover" className="btn bg-opacity-25 bg-secondary" onClick={() => {
                                        deletar(banco.id)

                                        router.reload(window.location.pathname)
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

function bancoModal(banco)
{

    return (
        <>

        </>)
}

export default Bancos;