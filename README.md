# insight-api
```shell
docker run  --name insight-api \
            -p 3000:3000 \
            -v /data/insight-api_data:/var/lib/insight-api/data \
            -e BITCOIND_HOST=x.x.x.x \
            -e BITCOIND_P2P_HOST=x.x.x.x \
            -e INSIGHT_NETWORK=livenet \
            -e BITCOIND_USER=user \
            -e BITCOIND_PASS=pass \
            -e INSIGHT_PUBLIC_PATH=public \
            -e ENABLE_HTTPS=false \
            -e INSIGHT_FORCE_RPC_SYNC = 1 \
            -d zouchao2010/insight-api


docker run  --name insight-api \
            -p 3000:3000 \
            -v /data/insight-api_data:/var/lib/insight-api/data \
            -e BITCOIND_HOST=x.x.x.x \
            -e BITCOIND_P2P_HOST=x.x.x.x \
            -e INSIGHT_NETWORK=livenet \
            -e BITCOIND_USER=user \
            -e BITCOIND_PASS=pass \
            -e INSIGHT_PUBLIC_PATH=public \
            -e ENABLE_HTTPS=false \
            -e INSIGHT_FORCE_RPC_SYNC = 1 \
            -it --rm zouchao2010/insight-api
```