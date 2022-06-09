const {PrismaClient} = require("@prisma/client");

class Banco {
    constructor(nome,numero,ispd){
        this.nome = nome
        this.numero = numero
        this.ispd = ispd
    }
    async criar(){
        const prisma = new PrismaClient()

        await prisma.banco.create({
            data: {
                nome: this.nome,
                numero: this.numero,
                ispd: this.ispd === "" ? null : parseInt(this.ispd)
            },
        })
    }
    async getBanco(id){
        const prisma = new PrismaClient()
        const banco = await prisma.banco.findUnique({
            where: {
                id: id
            }
        })
        this.nome = banco.nome
        this.numero = banco.numero
        this.ispd = banco.ispd
        this.id = banco.id

        return banco
    }
    async deletar(id){
        const prisma = new  PrismaClient()
        await prisma.banco.delete({
            where: {
                id: id
            },
        })
    }
}

module.exports = Banco