# export NAT_EXTIP=18.167.121.103
# export NAT_EXTIP=18.162.236.244


nohup erigon --config $PWD/network-configs/erigon-config2.yaml \
  --datadir=$PWD/erigon/execution-data2 \
  --authrpc.jwtsecret=$PWD/jwt.hex > $PWD/erigon2.log 2>&1 &
