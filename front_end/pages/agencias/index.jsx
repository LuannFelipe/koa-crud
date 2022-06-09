import Agencias from "../../components/agencias";

function VerArgncias({ agencias, bancos })
{
    return <><Agencias data={agencias} bancos={bancos}/></>

}

export async function getServerSideProps()
{
    const resAgencia = await fetch('http://localhost:3000/api/v1/agencias')
    const agencias = await resAgencia.json()

    const resBancos = await fetch('http://localhost:3000/api/v1/bancos')
    const bancos = await resBancos.json()

    return {
        props: {
            agencias,
            bancos
        }
    }
}

export default VerArgncias