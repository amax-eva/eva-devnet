
1）创建目录

```
mkdir -p $PWD/erigon/execution-data/

mkdir -p $PWD/prysm/beacon-data/
```

2）初始化数据

```
erigon init --datadir=$PWD/erigon/execution-data $PWD/network-configs/genesis.json
```

3）启动 erigon 执行层

```
erigon --config $PWD/network-configs/erigon-config.yaml \
  --datadir=$PWD/erigon/execution-data
  --authrpc.jwtsecret=$PWD/jwt.hex
  --nat=extip:18.167.121.103 \
  --bootnodes="enode://462f6efcc3181cda0510d6795b23078a29896917b40daa9c9b8192997810fd54e1875083650ffa95882051f1dd4c55870229855d8a1b6b123745f5d443147409@18.167.121.103:30303"
```

4) 启动共识层 信标

```
export USE_PRYSM_VERSION=v6.0.4


./prysm.sh beacon-chain --accept-terms-of-use=true \
  --datadir=$PWD/prysm/beacon-data/ \
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
  --suggested-fee-recipient=0xF84AE3A59D9c8a08b9308Ba4D3d0341135c51989 \
  --jwt-secret=$PWD/jwt.hex \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --pprof --pprofaddr=0.0.0.0 \
  --pprofport=6060 \
  --p2p-static-id=true \
  --chain-config-file=$PWD/network-configs/config.yaml \
  --genesis-state=$PWD/network-configs/genesis.ssz \
  --contract-deployment-block=0
```

5）运行验证服务

二个钱包

```
./prysm.sh validator --accept-terms-of-use=true \
  --chain-config-file=$PWD/network-configs/config.yaml \
  --suggested-fee-recipient=0xF84AE3A59D9c8a08b9308Ba4D3d0341135c51989 \
  --beacon-rest-api-provider=http://127.0.0.1:3500 \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --beacon-rpc-provider=127.0.0.1:4000 \
  --wallet-dir=$PWD/wallets-one \
  --wallet-password-file=$PWD/prysm-password/prysm-password.txt


./prysm.sh validator --accept-terms-of-use=true \
  --chain-config-file=$PWD/network-configs/config.yaml \
  --suggested-fee-recipient=0xF84AE3A59D9c8a08b9308Ba4D3d0341135c51989 \
  --beacon-rest-api-provider=http://127.0.0.1:3500 \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --beacon-rpc-provider=127.0.0.1:4000 \
  --wallet-dir=$PWD/wallets-two \
  --wallet-password-file=$PWD/prysm-password/prysm-password.txt
```



6）问题

6.1）出错时，可以清空数据

```
./prysm.sh validator --clear-db
```
