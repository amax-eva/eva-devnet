# export NAT_EXTIP=18.167.121.103
# export NAT_EXTIP=18.162.236.244


nohup erigon --config $PWD/network-configs/erigon-config.yaml \
  --datadir=$PWD/erigon/execution-data \
  --authrpc.jwtsecret=$PWD/jwt.hex \
  --nat=extip:$NAT_EXTIP > $PWD/erigon.log 2>&1 &
