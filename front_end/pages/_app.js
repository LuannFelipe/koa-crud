import 'bootstrap/dist/css/bootstrap.css'
import "../styles/globals.css"
import Header from "../components/layout/header";

function MyApp({ Component, pageProps }) {
    return(
        <>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                    crossOrigin="anonymous"></script>
            <Header/>
            <main className="mx-5">
                <Component {...pageProps} />
            </main>
        </>
    )
}

export default MyApp
