CREATE DATABASE "cursoDriven";

CREATE TABLE alunos(
    id SERIAL NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL,
    "turmaAtual" INTEGER NOT NULL,
)

CREATE TABLE turmas(
    id SERIAL NOT NULL PRIMARY KEY,
    codigo TEXT NOT NULL UNIQUE,
)

CREATE TABLE historicoAlunos(
    id SERIAL NOT NULL PRIMARY KEY,
    "alunoId" INTEGER NOT NULL,
    "turmaId" INTEGER NOT NULL,
    "dataInicio" DATE NOT NULL DEFAULT NOW(),
    "dataSaida" DATE NOT NULL DEFAULT NOW(),
    "cursoFinalizado" BOOLEAN NOT NULL DEFAULT FALSE
)

CREATE TYPE notas AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE projetos(
    id SERIAL NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    "alunoId" INTEGER NOT NULL,
    nota notas NOT NULL,
    "dataEntrega" TIMESTAMP NOT NULL,
    modulo INTEGER NOT NULL
)

CREATE TABLE modulos(
    id SERIAL NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
)

ALTER TABLE alunos ADD CONSTRAINT "alunos_fk0" FOREIGN KEY ("turmaAtual") REFERENCES "turmas"("id");

ALTER TABLE "historicoAlunos" ADD CONSTRAINT "historicoAlunos_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");
ALTER TABLE "historicoAlunos" ADD CONSTRAINT "historicoAlunos_fk1" FOREIGN KEY ("turmaId") REFERENCES "turmas"("id");

ALTER TABLE projetos ADD CONSTRAINT "projetos_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");
ALTER TABLE projetos ADD CONSTRAINT "projetos_fk1" FOREIGN KEY ("modulo") REFERENCES "modulos"("id");