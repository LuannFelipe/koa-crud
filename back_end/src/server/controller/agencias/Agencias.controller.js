const Router = require("koa-router")
const routes = new Router()
const { PrismaClient } = require('@prisma/client')
const Agencia = require("../../model/agencia/Agencia.model");
const prisma = new PrismaClient()


routes.get("/api/v1/agencias", async (ctx) => {
    let agencias
    const query = ctx.query


    if(query.inicio != null && query.total != null)
    {if(query.filtro != null && query.filtro >= 1)
    {
        switch (query.filtro)
        {
            case '1':
                //nome
                agencias = await prisma.agencia_bancaria.findMany({
                    orderBy:{
                        nome_agencia: 'asc'
                    },
                    skip: parseInt(query.inicio),
                    take: parseInt(query.total),

                })
                break
            case '2':
                //banco
                agencias = await prisma.agencia_bancaria.findMany({
                    orderBy:{
                        banco:{
                            nome: 'asc'
                        }
                    },
                    skip: parseInt(query.inicio),
                    take: parseInt(query.total),

                })
                break
            case '3':
                //fone1
                agencias = await prisma.agencia_bancaria.findMany({
                    orderBy:{
                        fone: 'asc'
                    },
                    skip: parseInt(query.inicio),
                    take: parseInt(query.total),
                })
                break
            case '4':
                //fone2
                agencias = await prisma.agencia_bancaria.findMany({
                    orderBy:{
                        fone1: 'asc'
                    },
                    skip: parseInt(query.inicio),
                    take: parseInt(query.total),
                })
                break
            case '5':
                //endereco
                agencias = await prisma.agencia_bancaria.findMany({
                    orderBy:{
                        endereco: 'asc'
                    },
                    skip: parseInt(query.inicio),
                    take: parseInt(query.total),
                })
                break
            case '6':
                //fone1
                agencias = await prisma.agencia_bancaria.findMany({
                    orderBy:{
                        agencia: 'asc'
                    },
                    skip: parseInt(query.inicio),
                    take: parseInt(query.total),
                })
                break
        }
    }else {
        agencias = await prisma.agencia_bancaria.findMany({
            skip: parseInt(query.inicio),
            take: parseInt(query.total)
        })
    }

    }else {
        agencias = await prisma.agencia_bancaria.findMany()
    }
    ctx.body = toJson(agencias)
})

routes.get("/api/v1/agencia/:id", async (ctx) => {
    const agencia = await prisma.agencia_bancaria.findUnique({
        where: {
            id: parseInt(ctx.params.id)
        }
    })
    ctx.body = toJson(agencia)
})

routes.post("/api/v1/novoAgencia", (ctx) => {
    ctx.body = ctx.request.body
    ctx.checkBody('nome').notBlank().notEmpty()
    ctx.checkBody('banco').notBlank().notEmpty().isNumeric()
    ctx.checkBody('fone1').empty().isNumeric().ge(11111111111).le(99999999999)
    ctx.checkBody('fone2').empty().isNumeric().ge(11111111111).le(99999999999)
    ctx.checkBody('endereco').notBlank().notEmpty()

    if(ctx.errors)
    {
        ctx.body = ctx.errors
    }else {
        const novaAgenciaOBJ = ctx.request.body
        const agencia = new Agencia(novaAgenciaOBJ.nome,novaAgenciaOBJ.banco,
                                    novaAgenciaOBJ.fone1,novaAgenciaOBJ.fone2,
                                    novaAgenciaOBJ.agencia, novaAgenciaOBJ.endereco)
        agencia.criar();
        ctx.redirect(`http://localhost:8080/agencias`)
    }

})

routes.put("/api/v1/editarAgencia/:id", async (ctx) => {
    const banco = ctx.request.body;

    const agenciaEditado = await prisma.agencia_bancaria.update({
        where: {
            id: parseInt(ctx.params.id),
        },
        data: {
            // nome: banco.nome,
            // numero: banco.numero,
            // ispd: parseInt(banco.ispd)
        },
    })
    ctx.body = agenciaEditado
    ctx.redirect(`http://localhost:3001/agencia/${agenciaEditado.id}`)

})

routes.delete('/api/v1/deletarAgencia/:id', (ctx) => {
    const agencia = new Agencia()
    agencia.deletar(parseInt(ctx.params.id))
})

function toJson(data) {
    return JSON.stringify(data, (_, v) => typeof v === 'bigint' ? `${v}n` : v)
        .replace(/"(-?\d+)n"/g, (_, a) => a);
}


module.exports = routes