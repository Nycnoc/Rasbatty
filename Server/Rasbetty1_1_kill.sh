# Rasbetty 1.1 filepart ConnectTunnel.sh
#        Copyright (C) 2020 Anja M. Tepe, Andreas Tepe
#
#       This file is part of Rasbetty
#
#    Rasbetty is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Rasbetty is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Rasbetty.  If not, see <http://www.gnu.org/licenses/>

#!/usr/bin/env bash

kill `ps -ef |grep sshd|grep batcorder |gawk '{ printf("%i ",$2) }'`
