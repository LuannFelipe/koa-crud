-- CreateTable
CREATE TABLE "Agencia" (
    "id" SERIAL NOT NULL,
    "fone" INTEGER,
    "tipo" INTEGER,
    "fone1" BIGINT,
    "tipo1" INTEGER,
    "fone2" BIGINT,
    "tipo2" INTEGER,
    "nome" VARCHAR(255) NOT NULL,
    "endereco" VARCHAR(255) NOT NULL,
    "bancoId" INTEGER NOT NULL,

    CONSTRAINT "Agencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Banco" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "ispd" INTEGER,
    "numero" VARCHAR(225) NOT NULL,

    CONSTRAINT "Banco_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Agencia_bancoId_key" ON "Agencia"("bancoId");

-- AddForeignKey
ALTER TABLE "Agencia" ADD CONSTRAINT "Agencia_bancoId_fkey" FOREIGN KEY ("bancoId") REFERENCES "Banco"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
