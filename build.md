
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
nohup erigon --config $PWD/network-configs/erigon-config.yaml \
  --datadir=$PWD/erigon/execution-data \
  --authrpc.jwtsecret=$PWD/jwt.hex \
  --bootnodes="enode://a29caa4c98026059d33765f88b3419a189f47b38604b53f932532ebae5498842e2b7269cf558e5b179cf7112a115afdad59bb41b8bae6f8201d5d0018b36037b@18.162.236.244:30303?discport=0" > $PWD/erigon.log 2>&1 &


erigon --config $PWD/network-configs/erigon-config.yaml \
  --datadir=$PWD/erigon/execution-data \
  --authrpc.jwtsecret=$PWD/jwt.hex \
  --bootnodes="enode://52273f553a5a4aff8a5a2846c819ec453efc46db04e0d29bf814d8cafb97d0f8d479e9a90372bbb53ce962188c3573a604183baab82d90c9a39d3a0a14619754@18.167.121.103:30303"
```

admin_peers 方法查询当前连接的对等节点，确认是否通过 bootnodes 建立了连接

curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"admin_peers","params":[],"id":1}' http://localhost:8545

admin_nodeInfo 方法获取节点的详细信息，包括 enode 和 P2P 配置

curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"admin_nodeInfo","params":[],"id":1}' http://localhost:8545

{"jsonrpc":"2.0","id":1,"result":{"id":"7b7403ef82d8a180959fdf3f4690b830f7855cebb962256308573569ba573635","name":"erigon/v3.0.15-1a610b3f/linux-amd64/go1.23.11","enode":"enode://52273f553a5a4aff8a5a2846c819ec453efc46db04e0d29bf814d8cafb97d0f8d479e9a90372bbb53ce962188c3573a604183baab82d90c9a39d3a0a14619754@18.167.121.103:30303","enr":"enr:-Je4QEm3Oa_m1JkSkMpf17FdGwqDWSuLNvRyEsO6JSVkLmW2Yzlp-Rtig_bwdgyqVCP-iB2w4OHmF35EPgQtv5VfMJsPg2V0aMfGhGDiLfSAgmlkgnY0gmlwhBKneWeJc2VjcDI1NmsxoQJSJz9VOlpK_4paKEbIGexFPvxG2wTg0pv4FNjK-5fQ-IN0Y3CCdl-DdWRwgnZf","ip":"enode://52273f553a5a4aff8a5a2846c819ec453efc46db04e0d29bf814d8cafb97d0f8d479e9a90372bbb53ce962188c3573a604183baab82d90c9a39d3a0a14619754@18.167.121.103:30303","ports":{"discovery":30303,"listener":30303},"listenAddr":"[::]:30303","protocols":{"eth":{"network":2248,"difficulty":0,"genesis":"0x98d4756195d5b6c66088cd6542c842895cf10c529d51691bfc47c138a9e5837b","config":{"chainName":"","chainId":2248,"homesteadBlock":0,"eip150Block":0,"eip155Block":0,"byzantiumBlock":0,"constantinopleBlock":0,"petersburgBlock":0,"istanbulBlock":0,"berlinBlock":0,"londonBlock":0,"terminalTotalDifficulty":0,"terminalTotalDifficultyPassed":true,"mergeNetsplitBlock":0,"shanghaiTime":0,"cancunTime":0,"pragueTime":0,"blobSchedule":{"cancun":{"target":3,"max":6,"baseFeeUpdateFraction":3338477},"prague":{"target":6,"max":9,"baseFeeUpdateFraction":5007716}},"depositContractAddress":"0x00000000219ab540356cbb839cbe05303d7705fa"},"head":"0x2cbf3ff68b2c46f669c70cdedd3542396946d53b274d8c8af0700a36a02a5e82"}}}}


curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"admin_nodeInfo","params":[],"id":1}' http://18.162.236.244:8545

{"jsonrpc":"2.0","id":1,"result":{"id":"214c3f9d0f1832b915cb3f96286bf307ec7d1cef05004c571bb9f4c7301ccfd9","name":"erigon/v3.0.15-1a610b3f/linux-amd64/go1.23.11","enode":"enode://a29caa4c98026059d33765f88b3419a189f47b38604b53f932532ebae5498842e2b7269cf558e5b179cf7112a115afdad59bb41b8bae6f8201d5d0018b36037b@18.162.236.244:30303?discport=0","enr":"enr:-JC4QARGOKaXv6mKqtmltFXyM2JdA1eLni_U2RO9ABMuUEijZUtsqEbgEGpA0RTo4VMoVTHPLxhI-hDcLlnTASy1LD8Eg2V0aMfGhGDiLfSAgmlkgnY0gmlwhBKi7PSJc2VjcDI1NmsxoQOinKpMmAJgWdM3ZfiLNBmhifR7OGBLU_kyUy665UmIQoN0Y3CCdl8","ip":"enode://a29caa4c98026059d33765f88b3419a189f47b38604b53f932532ebae5498842e2b7269cf558e5b179cf7112a115afdad59bb41b8bae6f8201d5d0018b36037b@18.162.236.244:30303?discport=0","ports":{"discovery":0,"listener":30303},"listenAddr":"[::]:30303","protocols":{"eth":{"network":2248,"difficulty":0,"genesis":"0x98d4756195d5b6c66088cd6542c842895cf10c529d51691bfc47c138a9e5837b","config":{"chainName":"","chainId":2248,"homesteadBlock":0,"eip150Block":0,"eip155Block":0,"byzantiumBlock":0,"constantinopleBlock":0,"petersburgBlock":0,"istanbulBlock":0,"berlinBlock":0,"londonBlock":0,"terminalTotalDifficulty":0,"terminalTotalDifficultyPassed":true,"mergeNetsplitBlock":0,"shanghaiTime":0,"cancunTime":0,"pragueTime":0,"blobSchedule":{"cancun":{"target":3,"max":6,"baseFeeUpdateFraction":3338477},"prague":{"target":6,"max":9,"baseFeeUpdateFraction":5007716}},"depositContractAddress":"0x00000000219ab540356cbb839cbe05303d7705fa"},"head":"0x76b958b820381b5ff3cb76aa2a4f904c0971c5e483f94a47d39aa74f9e61ef7b"}}}}


4) 启动共识层 信标

```
export USE_PRYSM_VERSION=v6.0.4


nohup ./prysm.sh beacon-chain --accept-terms-of-use=true \
  --datadir=$PWD/prysm/beacon-data/ \
  --execution-endpoint=http://18.167.121.103:8551 \
  --rpc-host=0.0.0.0 \
  --rpc-port=4000 \
  --http-host=0.0.0.0 \
  --http-cors-domain='*' \
  --http-port=3500 \
  --p2p-host-ip=18.167.121.103 \
  --p2p-tcp-port=13000 \
  --p2p-udp-port=12000 \
  --p2p-quic-port=13000 \
  --min-sync-peers=0 \
  --verbosity=debug \
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
  --contract-deployment-block=0 > $PWD/beacon.log 2>&1 &
```

5）运行验证服务

二个钱包

```
nohup ./prysm.sh validator --accept-terms-of-use=true \
  --chain-config-file=$PWD/network-configs/config.yaml \
  --suggested-fee-recipient=0xF84AE3A59D9c8a08b9308Ba4D3d0341135c51989 \
  --beacon-rest-api-provider=http://18.167.121.103:3500 \
  --disable-monitoring=false \
  --monitoring-host=0.0.0.0 \
  --monitoring-port=8080 \
  --beacon-rpc-provider=18.167.121.103:4000 \
  --wallet-dir=$PWD/wallets-one \
  --wallet-password-file=$PWD/prysm-password/prysm-password.txt > $PWD/validator.log 2>&1 &


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

curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"admin_peers","params":[],"id":1}' http://localhost:8545

curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"admin_nodeInfo","params":[],"id":1}' http://localhost:8545

curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://97ea2c05af0ded13bc0c3d3baef5747e9bdad506a09f212e5a1e45dc3e9513f38b0d4d363dfbbcb6d59475b35fc93add7b41815e282ab9e8b6e2111c24b26628@127.0.0.1:30303"],"id":1}' http://localhost:8545

curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://f53120c7169d946df8b12dc1dbfe5916aa3c70999060e4a58d1e2afaa265f2b23622a340a84ed076dc22a8caa3e35947828b887a3f77ca9f63ca3f1a2f2f725e@127.0.0.1:53429"],"id":1}' http://localhost:8547

