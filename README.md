# gio_sftp_auto_umount

I got sick of changing network and having to manually gio umount to stop Thunar freezing.

copy the file into place:

    sudo cp 01-gio_umount_sshfs.sh /etc/NetworkManager/dispatcher.d/pre-down.d/
    sudo chown root: /etc/NetworkManager/dispatcher.d/pre-down.d/01-gio_umount_sshfs.sh

