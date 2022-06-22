import Link from "next/link";
import Image from "next/image";

export default function Header()
{
    return (
        <header className="bg-dark mb-5 p-1 sticky-top">
            <nav className="navbar navb mx-5">
                <Link href="/">
                    <a className="text-white">
                        <Image src="/img/logo.png" alt="logo" width={26} height={26} layout="fixed"/>
                        <span className="ms-2">Banks Dianond</span>
                    </a>
                </Link>
                <div className="dropdown">
                    <button className="bg-transparent border-0 text-white dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">bancos</button>
                    <ul className="dropdown-menu bg-secondary" aria-labelledby="dropdownMenuButton1">
                        <li><Link href="/bancos"><a className="dropdown-item text-white">Bancos</a></Link></li>
                        <li><Link href="/banco/cadastrar"><a className="dropdown-item text-white">Adicionar banco</a></Link></li>
                    </ul>

                    <button className="bg-transparent border-0 text-white dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">agencias</button>
                    <ul className="dropdown-menu bg-secondary" aria-labelledby="dropdownMenuButton1">
                        <li><Link href="/agencias"><a className="dropdown-item text-white">Agencias</a></Link></li>
                        <li><Link href="/agencia/cadastrar"><a className="dropdown-item text-white">Adicionar agencias</a></Link></li>
                    </ul>

                </div>

            </nav>
        </header>

    )
}
