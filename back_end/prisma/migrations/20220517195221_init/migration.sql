/*
  Warnings:

  - You are about to drop the column `fone` on the `Agencia` table. All the data in the column will be lost.
  - You are about to drop the column `tipo` on the `Agencia` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Agencia" DROP COLUMN "fone",
DROP COLUMN "tipo";
