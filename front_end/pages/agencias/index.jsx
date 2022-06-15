import Agencias from "../../components/agencias";

function VerArgncias({ agencias, bancos })
{
    return <><Agencias bancos={bancos}/></>

}

export async function getServerSideProps()
{


    const resBancos = await fetch('http://localhost:3000/api/v1/bancos')
    const bancos = await resBancos.json()

    return {
        props: {
            bancos
        }
    }
}

export default VerArgncias