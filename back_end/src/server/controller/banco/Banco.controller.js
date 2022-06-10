const Router = require("koa-router")
const routes = new Router();

const { PrismaClient } = require('@prisma/client')
const Banco = require("../../model/banco/Banncos.model");

const prisma = new PrismaClient()


routes.get("/api/v1/bancos", async (ctx) => {
    let bancos

    const query = ctx.query
    console.log(query)

    if(query.inicio != null && query.total != null)
    {
        bancos = await prisma.banco.findMany({
            skip: parseInt(query.inicio),
            take: parseInt(query.total)
        })
    }else {
        bancos = await prisma.banco.findMany()
    }
    ctx.body = bancos
})

routes.get("/api/v1/banco/:id", async (ctx) => {
    const banco = await prisma.banco.findUnique({
        where: {
            id: parseInt(ctx.params.id)
        }
    })
    // getBanco(ctx)
    ctx.body = banco
})

routes.post("/api/v1/novoBanco",  (ctx) => {
    ctx.body = ctx.request.body
    ctx.checkBody('nome').notBlank().notEmpty()
    ctx.checkBody('numero').empty()
    ctx.checkBody('ispd').empty().isNumeric()

    if(ctx.errors)
    {
        ctx.body = ctx.errors
    }else {
        const novoBancoObj = ctx.request.body
        const banco = new Banco(novoBancoObj.nome,novoBancoObj.numero,novoBancoObj.ispd)
        banco.criar();
    }
})

routes.put("/api/v1/editarBanco/:id", async (ctx) => {
    const banco = ctx.request.body;
    const bancoEditado = await prisma.banco.update({
        where: {
            id: parseInt(ctx.params.id),
        },
        data: {
            nome: banco.nome,
            numero: banco.numero,
            ispd: parseInt(banco.ispd)
        },
    })
    ctx.body = bancoEditado
    ctx.redirect(`http://localhost:8080/banco/${bancoEditado.id}`)

})

routes.delete('/api/v1/deletar/:id',(ctx) => {
    const banco = new Banco()
    banco.deletar(parseInt(ctx.params.id))
})

module.exports = routes