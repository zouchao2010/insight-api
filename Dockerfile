FROM node:0.10

WORKDIR /opt
RUN apt-get update
RUN apt-get install -y git
RUN apt-get clean
RUN git clone https://github.com/bitpay/insight-api.git

WORKDIR /opt/insight-api
RUN npm install

VOLUME /var/lib/insight-api/data


# production|test|development
ENV NODE_ENV                        development
ENV BITCOIND_HOST                   127.0.0.1
ENV BITCOIND_P2P_HOST               $BITCOIND_HOST
ENV BITCOIND_USER                   user
ENV BITCOIND_PASS                   pass
ENV BITCOIND_DATADIR                /var/lib/insight-api/data/bitcoind

# livenet|testnet
ENV INSIGHT_NETWORK                 testnet
ENV INSIGHT_PORT                    3000
ENV INSIGHT_DB                      /var/lib/insight-api/data/db
ENV INSIGHT_SAFE_CONFIRMATIONS      6
ENV INSIGHT_IGNORE_CACHE            0
ENV ENABLE_CURRENCYRATES            true
ENV ENABLE_RATELIMITER              true
ENV LOGGER_LEVEL                    info
ENV ENABLE_HTTPS                    true
ENV ENABLE_EMAILSTORE               true
ENV INSIGHT_EMAIL_CONFIRM_HOST      https://insight-api.bitpay.com


WORKDIR /opt/insight-api

EXPOSE 3000
CMD ["node", "insight.js"]