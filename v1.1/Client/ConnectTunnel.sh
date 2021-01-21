# Rasbatty 1.1 filepart ConnectTunnel.sh
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

NServices=`ps -ef |grep ConnectTunnelPi2 |grep bash | wc -l`

if [ $NServices -gt "2" ]
then
  echo "Service already running. Exiting... "
  exit 2
fi

while [ 1 ]
do
  echo "Checking Service..."
#  ServiceRunning="`netstat  |grep 33100 |gawk '{ print $5 }'|grep :33100`"
  ServiceRunning="`ps -ef |grep pi2 |grep -v grep`"
  echo "Result: $ServiceRunning"

  if [ -z "$ServiceRunning" ]
  then
    echo "Starting ssh connection ... "
    ssh -N pi2
    echo "Service shutdown."
  fi
  sleep 10
done

exit 1
