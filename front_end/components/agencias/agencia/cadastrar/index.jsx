import * as React from "react"
import Image from "next/image";

export default function Casdastrar(){
    return(
        <div className="d-flex justify-content-center">
            <div className="mt-5">
                <Image src="/img/diamond2.png" width={375} height={375} layout={"fixed"}/>
            </div>
            <div className="mx-5 my-5 w-50">
                <h1 className="my-3">Agência</h1>
                <form action="http://localhost:3000/api/v1/novoAgencia" method="post" className="row gx-2 gy-3">

                    <input type="text" id="nome" name="nome" placeholder="nome*" className="border-0 border-bottom border-dark" required/>

                    <input type="text" id="banco" name="banco" placeholder="id do banco*" className="border-0 border-bottom border-dark" required/>

                    <input id="fone1" name="fone1" placeholder="telefone" type="number" className="border-0 border-bottom border-dark"/>

                    <input id="fone2" name="fone2" placeholder="telefone" type="number" className="border-0 border-bottom border-dark"/>

                    <input type="text" id="endereco" name="endereco" placeholder="endereço*" className="border-0 border-bottom border-dark"/>

                    <input type="text" id="agencia" name="agencia" placeholder="agencia" className="border-0 border-bottom border-dark"/>

                    <button type="submit" className="btn bg-black text-white col-2">Submit</button>

                </form>



            </div>
        </div>
    )
}
