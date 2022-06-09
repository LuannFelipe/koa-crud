require('dotenv').config()
const Koa = require('koa')
const logger = require('koa-logger')


const bancoRoute = require('./controller/banco/Banco.controller')
const agenciaRoute = require('./controller/agencias/Agencias.controller')
const cors = require('koa-cors');
const bodyParser = require('koa-bodyparser')


const port = process.env.PORT || '3000'

const server = new Koa()
require('koa-validate')(server)

server.use(logger())

server.use(bodyParser());
server.use(cors());
server.use(bancoRoute.routes())
server.use(agenciaRoute.routes())

server.listen(port,() => {
    console.log(`aberto em http://localhost:${port}`)
})

