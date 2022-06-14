import {useState} from "react";

const useBancos= (total) => {
    const [agencia, setAgencia] = useState([])
    function fetchAgencias(page)
    {

        const paginaVirtual = ((page - 1) * total) <= 0 ? 0 : ((page - 1) * total)
        console.log(paginaVirtual)
        fetch(`http://localhost:3000/api/v1/agencias?inicio=${paginaVirtual}&total=${total}`).then(res => res.json()).then(data => setAgencia(data)).catch((e) => {
            alert(e)
        })
    }
    return {
        fetchAgencias,
        agencia
    }
}


export default useBancos