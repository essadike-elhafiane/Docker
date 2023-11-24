#!/bin/sh 

if [ ! -f "/etc/vsftpd.conf.bak" ]; then 

    mkdir -p /var/www/html 
    mkdir -p /etc/vsftpd/
    mkdir -p /var/run/vsftpd/empty
    cp /etc/vsftpd.conf /etc/vsftpd.conf.bak 
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf 
    mkdir -p /var/run/vsftpd/empty
    chown $FTP_USR:$FTP_USR /var/run/vsftpd/empty
    chmod 755 /var/run/vsftpd/empty
    # Add new user
    adduser $FTP_USR --disabled-password 
    echo  "$FTP_USR:$FTP_PSWD" | /usr/sbin/chpasswd &> /dev/null 
    # User permission on the file 
    chown -R $FTP_USR:$FTP_USR /var/www/html 

    # Gets the FTP_USR value from env and writes it to the vsftpd.userlist file 
    echo  $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null 

fi 

# vsftpd start 
echo  "FTP started on :21"
 /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf