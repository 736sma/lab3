FROM alpine
WORKDIR /usr/assembler/
COPY ./lab3.s .
COPY ./lab3.c .
RUN apk add build-base
RUN apk add nano
RUN apk add gdb
RUN gcc lab3.s lab3.c -no-pie -o cpp_assembler -g
ENTRYPOINT /bin/sh