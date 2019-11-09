USE master
CREATE DATABASE example
GO
USE example
CREATE TABLE animals (
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(64) NOT NULL,
    kind VARCHAR(64) NOT NULL,
    birthday datetime NOT NULL
)
GO