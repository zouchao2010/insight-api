FROM node:0.10

WORKDIR /opt
RUN apt-get update
RUN apt-get install -y git
RUN apt-get clean
RUN git clone https://github.com/bitpay/insight-api.git

WORKDIR /opt/insight-api
RUN npm install

VOLUME /var/lib/insight-api/data


#Configuration
ENV NODE_ENV                        development                                     # production|test|development

ENV BITCOIND_HOST                   127.0.0.1                                       # RPC bitcoind host
#ENV BITCOIND_PORT                                                                   # RPC bitcoind Port
ENV BITCOIND_P2P_HOST               $BITCOIND_HOST                                  # P2P bitcoind Host (will default to BITCOIND_HOST, if specified)
#ENV BITCOIND_P2P_PORT                                                               # P2P bitcoind Port
ENV BITCOIND_USER                   user                                            # RPC username
ENV BITCOIND_PASS                   pass                                            # RPC password
ENV BITCOIND_DATADIR                /var/lib/insight-api/data/bitcoind              # bitcoind datadir. 'testnet3' will be appended automatically if testnet is used. NEED to finish with '/'. e.g: `/vol/data/`

ENV INSIGHT_NETWORK                 testnet                                         # livenet|testnet
ENV INSIGHT_PORT                    3000                                            # insight api port
ENV INSIGHT_DB                      /var/lib/insight-api/data/db                    # Path where to store insight's internal DB. (defaults to $HOME/.insight)
ENV INSIGHT_SAFE_CONFIRMATIONS      6                                               # Nr. of confirmation needed to start caching transaction information
ENV INSIGHT_IGNORE_CACHE            0                                               # True to ignore cache of spents in transaction, with more than INSIGHT_SAFE_CONFIRMATIONS confirmations. This is useful for tracking double spents for old transactions.
ENV ENABLE_CURRENCYRATES            true                                            # if "true" will enable a plugin to obtain historic conversion rates for various currencies
ENV ENABLE_RATELIMITER              true                                            # if "true" will enable the ratelimiter plugin
ENV LOGGER_LEVEL                    info                                            # defaults to 'info', can be 'debug','verbose','error', etc.
ENV ENABLE_HTTPS                    true                                            # if "true" it will server using SSL/HTTPS
ENV ENABLE_EMAILSTORE               true                                            # if "true" will enable a plugin to store data with a validated email address
ENV INSIGHT_EMAIL_CONFIRM_HOST      https://insight.bitpay.com                      # Only meanfull if ENABLE_EMAILSTORE is enable. Hostname for the confirm URLs. E.g: 'https://insight.bitpay.com'


WORKDIR /opt/insight-api

EXPOSE 3000
CMD ["node", "insight.js"]