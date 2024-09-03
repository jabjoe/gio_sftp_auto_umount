#! /bin/bash

if [ -n "$DBUS_SESSION_BUS_ADDRESS" ]
then
  while read line
  do
    if [ -n "$line" ]
    then
      gio mount -u -f $line
    fi
  done <<< "$(gio mount -l | awk '/sftp/ {print $6}')"
else
  user_ids=$(ls -1 /run/user/)
  for user_id in $user_ids
  do
    username=$(id -nu $user_id)
    echo "Unmounting any sftp of user $username"
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$user_id/bus sudo -u $username --preserve-env=DBUS_SESSION_BUS_ADDRESS $0
  done
fi

#while read line; do gio mount -u -f $line; done <<< "$(gio mount -l | awk '/sftp/ {print $6}')"
