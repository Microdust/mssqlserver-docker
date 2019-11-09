##SQL Server in Docker
 
This repository provides a Dockerfile and docker-compose for setting up a simple MS SQL Server for local development
 
#Content
- Dockerfile: Using Debian buster as the primary image for the container
- init.sql: The file used to initialize the database with tables etc.
- mssql.conf: Configuration file for MS SQL Server built into the container.
- entrypoint.sh: The shell script to initiate both SQL Server & run init.sql
 
 
#Notes:
- Currently running MS SQL Server version 14.0.3192.2-2 as later versions have issues on Linux
