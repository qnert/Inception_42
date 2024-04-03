#!/bin/bash

if [ ! -f "/etc/vsftpd/vsftpd_main.conf" ]; then
  envsubst '${FTP_USER}' < "/etc/vsftpd/vsftp.conf" > "/etc/vsftpd/vsftpd_main.conf"
  mkdir -p /home/$FTP_USER/ftp/files
  mkdir -p /var/run/vsftpd/empty

  adduser $FTP_USER --disabled-password &> /dev/null
  echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null

  chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

  chmod +x /etc/vsftpd/vsftpd_main.conf
  echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null
fi

/usr/sbin/vsftpd /etc/vsftpd/vsftpd_main.conf
