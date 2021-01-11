#!/usr/bin/env bash

LOGFILE="/home/batcorder/Log/rsync.log"

echo  >> "$LOGFILE"
echo "New Raspberry readout at" `date` >> "$LOGFILE"
echo  >> "$LOGFILE"
#rsync -uva -e "ssh -i /home/anja/.ssh/id_rsa -p 6667 -l pi" pi@localhost:/media/pi/* /home/batcorder/data/location02 >> /home/batcorder/rsync.log
#rsync -uva raspberry:/media/pi/* /home/batcorder/Data/location02 >> "$LOGFILE"

for i in `seq 12`
do
  n=$(printf "%02d" $i);
  RASPBERRY="raspberry"
  PORT="650$n"
  DIRECTORY="location$n"
  echo "**** Reading from Raspberry $n ****" >> "$LOGFILE"
  ssh -p"$PORT" -q -o "BatchMode=yes" "$RASPBERRY" "echo 2>&1" && SSH_OK=yes || SSH_OK=no
  echo "Raspberry $n connected: $SSH_OK" >> "$LOGFILE"
  if [ $SSH_OK == "yes" ]
  then
    echo "Reading from Raspberry $n ..." >> "$LOGFILE"
    rsync -uva -e "ssh -p$PORT -l pi" "$RASPBERRY":/media/pi/* /home/batcorder/Data/"$DIRECTORY" >> "$LOGFILE"
  fi
done
