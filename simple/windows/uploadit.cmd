@echo off

plink -P 10022 root@localhost -pw "" "killall -9 gdbserver simple"
pscp -scp -P 10022 -pw "" simple root@localhost:/media/internal
