const {PrismaClient} = require("@prisma/client");

class Agencia{
    constructor(nome,banco,fone1,fone2,agencia,endereco) {
        this.nome = nome
        this.banco = banco
        this.fone1 = fone1
        this.fone2 = fone2
        this.agencia = agencia
        this.endereco = endereco
    }
    async criar()
    {
        const prisma = new PrismaClient()

        await prisma.agencia_bancaria.create({
            data: {
                fone: this.fone1 === "" ? null : parseInt(this.fone1),
                fone1: this.fone2 === "" ? null : parseInt(this.fone2),
                agencia: this.agencia,
                banco: {
                    connect: {
                        id: parseInt(this.banco),
                    }
                },
                nome_agencia: this.nome,
                endereco: this.endereco,

            }
        })
    }
    async deletar(id)
    {
        const prisma = new  PrismaClient()
        await prisma.agencia_bancaria.delete({
            where: {
                id: id
            },
        })
    }
}

module.exports = Agencia