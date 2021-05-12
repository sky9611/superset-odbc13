FROM amancevice/superset

# Switching to root to install the required packages
USER root

# Install database drivers
# RUN pip install psycopg2
# RUN pip install pyhive
# RUN echo 'deb http://cz.archive.ubuntu.com/ubuntu lucid main universe ' > /etc/apt/source.list
# RUN apt-get install unixodbc
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install msodbcsql=13.0.1.0-1 mssql-tools=14.0.2.0-1
RUN apt-get install unixodbc-dev-utf16
RUN ln -sfn /opt/mssql-tools/bin/sqlcmd-13.0.1.0 /usr/bin/sqlcmd
RUN ln -sfn /opt/mssql-tools/bin/bcp-13.0.1.0 /usr/bin/bcp
RUN pip install pyodbc
RUN pip install pymssql

# Switch back to using the `superset` user
USER superset