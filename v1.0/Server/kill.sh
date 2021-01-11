#!/usr/bin/env bash

kill `ps -ef |grep sshd|grep batcord+ |gawk '{ printf("%i ",$2) }'`

