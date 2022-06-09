import Link from "next/link";
import Image from "next/image";


const Banco = ({ agencia, banco }) => {
    return (
        <>
          <div className="d-flex justify-content-center">
              <div className="border border-dark p-3 rounded-3">
                  <header className="border-bottom pb-3">
                      <h5 className="modal-title" id="exampleModalLabel">{agencia.nome_agencia} <Image src="/img/diamond.png" width={24} height={24} layout={"fixed"}/> </h5>
                  </header>
                  <div className="py-3">
                      <p><strong>Id: </strong>{agencia.id }</p>
                      <p><strong>Nome: </strong>{agencia.nome_agencia}</p>
                      <p><strong>Banco: </strong>{banco.nome}</p>
                      <p><strong>Fone1: </strong>{agencia.fone == null ? <>vazio</> : agencia.fone}</p>
                      <p><strong>Fone2: </strong>{agencia.fone1 == null ? <>vazio</> : agencia.fone1}</p>
                      <p><strong>Agecia: </strong>{agencia.agencia === "" ? <>vazio</> : agencia.agencia}</p>
                      <p><strong>Endereço: </strong>{agencia.endereco}</p>
                  </div>
                  <footer className="d-flex justify-content-end border-top pt-3">
                      <button type="button" className="btn bg-black text-white" data-bs-dismiss="modal">Fechar</button>
                      <button type="button" className="btn bg-black text-white w-auto ms-2" data-bs-dismiss="modal" onClick={() => {
                          console.log(agencia.id)
                      }}>Remover</button>
                  </footer>
              </div>
          </div>
        </>
    )
}
export default Banco