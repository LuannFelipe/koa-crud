import {useState} from "react";

const useBancos= (total) => {
    const [bancos, setBancos] = useState([])
    function fetchBancos(page, filtro)
    {

        const paginaVirtual = ((page - 1) * total) <= 0 ? 0 : ((page - 1) * total)
        console.log(paginaVirtual)
        fetch(`http://localhost:3000/api/v1/bancos?inicio=${paginaVirtual}&total=${total}&filtro=${filtro}`).then(res => res.json()).then(data => setBancos(data)).catch((e) => {
            alert(e)
        })

    }
    return {
        fetchBancos,
        bancos
    }
}


export default useBancos