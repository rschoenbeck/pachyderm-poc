FROM ubuntu:18.04

COPY ./query_file.sql /snow/query_file.sql
WORKDIR /snow

ENV SNOWSQL_DEST=/snow
ENV SNOWSQL_LOGIN_SHELL=/root/.profile
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV SNOWSQL_HOST=kiva.snowflakecomputing.com
ENV SNOWSQL_ACCOUNT=kiva

RUN apt-get update && apt-get install -y \
   curl
RUN curl -o /snow/snowsql-1.1.76-linux_x86_64.bash http://s3-us-west-2.amazonaws.com/sfc-snowsql-updates/bootstrap/1.1/linux_x86_64/snowsql-1.1.76-linux_x86_64.bash
RUN chmod +x /snow/snowsql-1.1.76-linux_x86_64.bash
RUN /snow/snowsql-1.1.76-linux_x86_64.bash
RUN chmod +x /snow/snowsql
RUN mkdir output

CMD ["/snow/snowsql","-f","query_file.sql",\
"-o","output_file=/snow/output/result.csv",\
"-o","quiet=true",\
"-o","output_format=csv",\
"-o","friendly=false"] 
