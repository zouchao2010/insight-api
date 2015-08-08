# insight-api

## build
```shell
docker build -t zouchao2010/insight-api .

```

## pull
```shell
docker pull zouchao2010/insight-api

```

## mkdir(创建DB目录)
```shell
mkdir -p /data/insight-api/db/testnet
mkdir -p /data/insight-api/db/livenet

```

## run(创建并运行一个容器，退出时删除容器)
```shell
docker run  --name insight-api \
            -h insight-api \
            -p 3000:3000 \
            -v /data/insight-api:/var/lib/insight-api/data \
            -e BITCOIND_HOST=x.x.x.x \
            -e BITCOIND_P2P_HOST=x.x.x.x \
            -e INSIGHT_NETWORK=livenet \
            -e BITCOIND_USER=user \
            -e BITCOIND_PASS=pass \
            -e INSIGHT_PUBLIC_PATH=public \
            -e ENABLE_HTTPS=false \
            -e INSIGHT_FORCE_RPC_SYNC=1 \
            -it --rm zouchao2010/insight-api
            
```

## run(创建并运行一个容器，以守护进程方式)
```shell
docker run  --name insight-api \
            -h insight-api \
            -p 3000:3000 \
            -v /data/insight-api:/var/lib/insight-api/data \
            -e BITCOIND_HOST=x.x.x.x \
            -e BITCOIND_P2P_HOST=x.x.x.x \
            -e INSIGHT_NETWORK=livenet \
            -e BITCOIND_USER=user \
            -e BITCOIND_PASS=pass \
            -e INSIGHT_PUBLIC_PATH=public \
            -e ENABLE_HTTPS=false \
            -e INSIGHT_FORCE_RPC_SYNC=1 \
            -dt zouchao2010/insight-api
            
```

## start|stop|restart(已存在的容器)
```shell
docker start|stop|restart insight-api

```

## exec(使用已运行的容器执行命令)
```shell
docker exec -it insight-api /bin/bash

```