import {useState} from "react";

const useBancos= (total) => {
    const [bancos, setBancos] = useState([])
    function feachtBancos(page, filtro)
    {

        const paginaVirtual = ((page - 1) * total) <= 0 ? 0 : ((page - 1) * total)
        console.log(paginaVirtual)
        fetch(`http://localhost:3000/api/v1/bancos?inicio=${paginaVirtual}&total=${total}&filtro=${filtro}`).then(res => res.json()).then(data => setBancos(data)).catch((e) => {
            alert(e)
        })

    }
    return {
        feachtBancos,
        bancos
    }
}


export default useBancos