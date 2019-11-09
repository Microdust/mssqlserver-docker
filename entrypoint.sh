#!/bin/bash

initiate_table () {
    while : ;
        do
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /init.sql
        if [ $? -eq 0 ]; then
            break
        fi
    done
}

(initiate_table)&(/opt/mssql/bin/sqlservr)
