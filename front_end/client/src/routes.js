import React from "react";
import { Route, BrowserRouter } from "react-router-dom";

import Bancos from "./pages/bancos";


const Routes = () => {
    return(
        <BrowserRouter>
            <Routes>
                <Route component = { Bancos }  path="/" exact />
            </Routes>
        </BrowserRouter>
    )
}

export default Routes;