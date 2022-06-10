import Link from "next/link";
import Image from "next/image";
import { useRouter } from 'next/router'


const Banco = ({ banco }) => {
    const route = useRouter()
    return (
        <>
          <div className="d-flex justify-content-center">
              <div className="border border-dark p-3 rounded-3 ">
                  <header className="border-bottom pb-3">
                      <h5 >{banco.nome} <Image src="/img/diamond.png" width={24} height={24} layout={"fixed"}/> </h5>
                  </header>
                  <div className="py-3">
                      <p><strong>Id: </strong>{banco.id}</p>
                      <p><strong>Nome: </strong>{banco.nome}</p>
                      <p><strong>Numero: </strong>{banco.numero === '' ? <>vazio</> : banco.numero}</p>
                      <p><strong>Ispd: </strong>{banco.ispd == null ? <>vazio</> : banco.ispd}</p>
                  </div>
                  <footer className="d-flex justify-content-end border-top pt-3">
                      <button type="button" className="btn bg-black text-white" data-bs-dismiss="modal" onClick={() => {
                          route.back()
                      }}>voltar</button>
                     <button type="button" className="btn bg-black text-white w-auto ms-2"  onClick={() => {
                         deletar(banco.id)
                         route.push("/bancos")
                      }}>Remover</button>
                  </footer>
              </div>
          </div>
        </>
    )
}

async function deletar(id){
    await fetch(`http://localhost:3000/api/v1/deletar/${id}`,
        {
            method: 'DELETE'
    })
}
export default Banco