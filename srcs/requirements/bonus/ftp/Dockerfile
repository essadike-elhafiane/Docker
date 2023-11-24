FROM debian:11

RUN  apt-get update && apt-get upgrade -y && apt-get install -y \
    vsftpd\
    inetutils-ftp\
    filezilla

COPY ./vsftpd.conf /tmp/vsftpd.conf

COPY ./tools/ftpScript.sh /tmp/ftpScript.sh

ENTRYPOINT ["sh", "/tmp/ftpScript.sh"]
