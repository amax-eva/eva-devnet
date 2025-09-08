# export NAT_EXTIP=18.167.121.103
# export NAT_EXTIP=18.162.236.244


nohup ./prysm.sh beacon-chain --chain-id=2248 --network-id=2248 --accept-terms-of-use=true \
  --datadir=$PWD/prysm/beacon-data2/ \
  --execution-endpoint=http://192.168.96.69:8552 \
  --rpc-host=0.0.0.0 \
  --rpc-port=4001 \
  --http-host=0.0.0.0 \
  --http-cors-domain='*' \
  --http-port=3501 \
  --no-discovery \
  --p2p-host-ip=192.168.96.69 \
  --p2p-tcp-port=13001 \
  --p2p-udp-port=12001 \
  --p2p-quic-port=13001 \
  --min-sync-peers=0 \
  --verbosity=debug \
  --slots-per-archive-point=256 \
  --suggested-fee-recipient=0xD5ffAa51c9242d1c36b214f99a775442DF378D54 \
  --jwt-secret=$PWD/jwt.hex \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8081 \
  --pprof --pprofaddr=0.0.0.0 \
  --pprofport=6061 \
  --p2p-static-id=true \
  --chain-config-file=$PWD/network-configs/config.yaml \
  --genesis-state=$PWD/network-configs/genesis.ssz \
  --contract-deployment-block=0 \
  --bootstrap-node="enr:-Mq4QMvvMx-q1LK2AIKWo5GV4pB7EJfCYiy-aDGCA5BjmsaWBB-SjxKJYJMYcmKE8kNFOJ5QVpWjQKjxan95Soi9oKmGAZkn9V0Ch2F0dG5ldHOIAAAAAAAAgAGEZXRoMpCLUxW_cAAAOP__________gmlkgnY0gmlwhH8AAAGEcXVpY4IyyIlzZWNwMjU2azGhAxgaT4YOovbgLsflLSRfTUGsaw55dH9jiu8va3JyqLSmiHN5bmNuZXRzD4N0Y3CCMsiDdWRwgi7g" \
  --checkpoint-sync-url=http://192.168.96.69:3500 \
  > $PWD/beacon2.log 2>&1 &

# --no-discovery \
# --peer="/ip4/192.168.96.69/tcp/13000/p2p/16Uiu2HAmEH5QRTD9ufnaUgktTRP6VGDmSuPVzsDPhixEFaf93TKT" \
# --genesis-beacon-api-url=http://192.168.96.69:3500 \