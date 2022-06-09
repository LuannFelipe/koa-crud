/*
  Warnings:

  - Added the required column `fone2` to the `Agencia` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo2` to the `Agencia` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Agencia" ADD COLUMN     "fone2" INTEGER NOT NULL,
ADD COLUMN     "tipo2" INTEGER NOT NULL;
