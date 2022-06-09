import axios from "axios";

// topics api
export async function getBancos() {
    return axios.get("http://localhost:3000/api/bancos");
}