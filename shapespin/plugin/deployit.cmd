call buildit.cmd

plink -P 10022 root@localhost -pw "" killall -9 shapespin_plugin
pscp -scp -P 10022 -pw "" shapespin_plugin root@localhost:/media/internal
