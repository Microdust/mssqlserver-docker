FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

# Accept MSSQL EULA
ENV ACCEPT_EULA=Y

# Copy init sql file and conf file into container
COPY init.sql /
COPY mssql.conf /var/opt/mssql/mssql.conf
COPY entrypoint.sh /

RUN apt-get update

# Add source to apt package manager (required for: libssl)
RUN echo 'deb http://ftp.debian.org/debian jessie main' >> /etc/apt/sources.list
RUN apt-get -qq -y install curl gnupg2 apt-transport-https libssl1.0 locales

# Configure locales to make sqlcmd executable
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen && locale-gen

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -  && \
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list >> /etc/apt/sources.list.d/mssql-server.list && \
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list >> /etc/apt/sources.list.d/msprod.list

RUN apt-get update
RUN apt-get -qq -y install mssql-server=14.0.3192.2-2 mssql-tools unixodbc-dev

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]