import * as React from "react";
import Image from "next/image";

export default function Casdastrar(){
    return(
        <div className="d-flex justify-content-center ">
            <div className="mt-5">
                <Image src="/img/dianamond2.png" width={257} height={257} layout={"fixed"}/>
            </div>
            <div className="mx-5 my-5">
                <h2>Banco</h2>
                <form action="http://localhost:3000/api/v1/novoBanco" method="post" className="row gx-3 gy-4 mt-1 ">
                    <input type="text" id="nome" name="nome" placeholder="nome*"  required className="border-0 border-bottom border-dark"/>

                    <input type="text" id="numero" name="numero" placeholder="numero" className="border-0 border-bottom border-dark"/>

                    <input type="number" id="ispd" name="ispd" placeholder="ispdS" className="border-0 border-bottom border-dark"/>

                    <button type="submit" className="btn bg-black text-white col-2 ">Submit</button>
                </form>
            </div>
        </div>
    )
}
