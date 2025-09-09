
nohup beacon-chain --chain-id=2248 --network-id=2248 \
  --accept-terms-of-use=true \
  --datadir=$PWD/prysm/beacon-data/ \
  --execution-endpoint=http://18.163.81.118:8551 \
  --rpc-host=0.0.0.0 \
  --rpc-port=4000 \
  --http-host=0.0.0.0 \
  --http-cors-domain=* \
  --http-port=3500 \
  --p2p-host-ip=18.163.81.118 \
  --p2p-tcp-port=13000 \
  --p2p-udp-port=12000 \
  --p2p-quic-port=13000 \
  --min-sync-peers=0 \
  --verbosity=info \
  --slots-per-archive-point=32 \
  --suggested-fee-recipient=0x6318BC08F350835f8b2e2A542f04e2aB129Ab5C4 \
  --jwt-secret=$PWD/jwt.hex \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --pprof \
  --pprofaddr=0.0.0.0 \
  --pprofport=6060 \
  --p2p-static-id=true \
  --chain-config-file=$PWD/network-configs/config.yaml \
  --genesis-state=$PWD/network-configs/genesis.ssz \
  --contract-deployment-block=0 \
  > $PWD/beacon.log 2>&1 &