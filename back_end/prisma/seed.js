const { bancos } = require('./bancos')
const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient;

async function main()
{
        await prisma.banco.create({
            data: {
                nome: "BANCO DO BRASIL S.A (BB)",
                numero: "001",
                ispd: 0
            }
        })
}

main().catch(e => {
    console.log(e)
    process.exit(1)
}).finally(() => {
    prisma.$disconnect()
})