# Rasbatty 1.1 filepart rsync.sh
#	 Copyright (C) 2020 Anja M. Tepe, Andreas Tepe
# 
#	This file is part of Rasbatty
#
#    Rasbatty is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Rasbatty is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Rasbatty.  If not, see <http://www.gnu.org/licenses/>.

#!/usr/bin/env bash

LOGFILE="/home/batcorder/Log/rsync.log"
DATADIR="/home/batcorder/Data/"
SSH_NAME="raspberry"

echo  >> "$LOGFILE"
echo "New Raspberry readout at" `date` >> "$LOGFILE"
echo  >> "$LOGFILE"
#rsync -uva -e "ssh -i /home/anja/.ssh/id_rsa -p 6667 -l pi" pi@localhost:/media/pi/* /home/batcorder/data/location02 >> /home$
#rsync -uva raspberry:/media/pi/* /home/batcorder/Data/location02 >> "$LOGFILE"

for i in `seq 12`
do
  n=$(printf "%02d" $i);
  PORT="540$n"
  DIRECTORY="$DATADIR/location$n"
  echo "**** Reading from Raspberry $n ****" >> "$LOGFILE"
  ssh -p"$PORT" -q -o "BatchMode=yes" "$SSH_NAME" "echo 2>&1" && SSH_OK=yes || SSH_OK=no
  echo "Raspberry $n connected: $SSH_OK" >> "$LOGFILE"
  if [ $SSH_OK == "yes" ]
  then
    echo "Reading from Raspberry $n ..." >> "$LOGFILE"
    rsync -uva -e "ssh -p$PORT -l pi" "$SSH_NAME":/media/pi/USB_ANJA/Test* "$DIRECTORY" &>> "$LOGFILE"
  fi
done
