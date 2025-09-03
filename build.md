
erigon init --datadir=./erigon/execution-data ./network-configs/genesis.json



erigon --networkid=3151908 \
  --log.console.verbosity=3 \
  --datadir=./erigon/execution-data \
  --port=30303 \
  --http.api=eth,erigon,engine,web3,net,debug,trace,txpool,admin \
  --http.vhosts='*' \
  --ws \
  --allow-insecure-unlock \
  --nat=extip:127.0.0.1 \
  --http \
  --http.addr=0.0.0.0 \
  --http.corsdomain='*' \
  --http.port=8545 \
  --authrpc.jwtsecret=./jwt.hex \
  --authrpc.addr=0.0.0.0 \
  --authrpc.port=8551 \
  --authrpc.vhosts='*' \
  --externalcl \
  --metrics \
  --metrics.addr=0.0.0.0 \
  --metrics.port=9001 \
  --torrent.port=42069



beacon-chain --accept-terms-of-use=true \
  --datadir=./prysm/beacon-data/ \
  --execution-endpoint=http://127.0.0.1:8551 \
  --rpc-host=0.0.0.0 \
  --rpc-port=4000 \
  --http-host=0.0.0.0 \
  --http-cors-domain='*' \
  --http-port=3500 \
  --p2p-host-ip=127.0.0.1 \
  --p2p-tcp-port=13000 \
  --p2p-udp-port=12000 \
  --p2p-quic-port=13000 \
  --min-sync-peers=0 \
  --verbosity=info \
  --slots-per-archive-point=32 \
  --suggested-fee-recipient=0x8943545177806ED17B9F23F0a21ee5948eCaa776 \
  --jwt-secret=./jwt.hex \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --pprof --pprofaddr=0.0.0.0 \
  --pprofport=6060 \
  --p2p-static-id=true \
  --chain-config-file=./network-configs/config.yaml \
  --genesis-state=./network-configs/genesis.ssz \
  --contract-deployment-block=0



validator --accept-terms-of-use=true \
  --chain-config-file=./network-configs/config.yaml \
  --suggested-fee-recipient=0x8943545177806ED17B9F23F0a21ee5948eCaa776 \
  --beacon-rest-api-provider=http://127.0.0.1:3500 \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --beacon-rpc-provider=127.0.0.1:4000 \
  --wallet-dir=./validator-keys/prysm \
  --wallet-password-file=./prysm-password/prysm-password.txt

