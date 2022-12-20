CREATE DATABASE drivenBank;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "fullName" VARCHAR(50) NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
)

CREATE TYPE "phoneTypes" AS ENUM ('landline', 'mobile');

CREATE TABLE "customerPhones" (
     id SERIAL PRIMARY KEY,
     "customerId" INTEGER NOT NULL,
     number VARCHAR(14) NOT NULL UNIQUE,
     type "phoneTypes" 
)

CREATE TABLE "customerAddresses" (
     id SERIAL PRIMARY KEY,
     "customerId" INTEGER NOT NULL,
     "street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" TEXT NOT NULL,
	"cityId" INTEGER NOT NULL 
)

CREATE TABLE cities (
     id SERIAL PRIMARY KEY,
     name TEXT NOT NULL,
     "stateId" INTEGER NOT NULL
)

CREATE TABLE states (
     id SERIAL PRIMARY KEY,
     name TEXT NOT NULL,
)

CREATE TABLE "bankAccount" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" VARCHAR(6) UNIQUE,
    agency VARCHAR(4) UNIQUE,
    "openDate" DATE,
    "closeDate" DATE
)

CREATE TYPE "transactionTypes" AS ENUM ('deposit', 'withdraw');

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    type "transactionTypes",
    time TIMESTAMP DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN DEFAULT FALSE
)

CREATE TABLE "creditCards" (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    name TEXT NOT NULL UNIQUE,
    number TEXT NOT NULL UNIQUE,
    "securityCode" TEXT NOT NULL, 
    "expirationMonth" DATE NOT NULL,
    "expirationYear" DATE NOT NULL,
    password TEXT NOT NULL,
    limit INTEGER NOT NULL
)

ALTER TABLE "customerPhone" ADD CONSTRAINT "customerPhone_fk0" FOREIGN KEY ("customersId") REFERENCES "customers"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customersId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "state"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customersId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCard" ADD CONSTRAINT "creditCard_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");