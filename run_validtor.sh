# export NAT_EXTIP=18.167.121.103
# export NAT_EXTIP=18.162.236.244


nohup ./prysm.sh validator --accept-terms-of-use=true \
  --chain-config-file=$PWD/network-configs/config.yaml \
  --suggested-fee-recipient=0xF84AE3A59D9c8a08b9308Ba4D3d0341135c51989 \
  --beacon-rest-api-provider=http://$NAT_EXTIP:3500 \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --beacon-rpc-provider=$NAT_EXTIP:4000 \
  --wallet-dir=$PWD/wallets-one \
  --wallet-password-file=$PWD/prysm-password/prysm-password.txt > $PWD/validator.log 2>&1 &