FROM php:7.4-alpine

ARG REVIEWDOG_VERSION=v0.9.17
ARG PHPCS_VERSION=3.5.4

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN wget -P /usr/local/bin -q https://github.com/squizlabs/PHP_CodeSniffer/releases/download/${PHPCS_VERSION}/phpcs.phar \
 && chmod +x /usr/local/bin/phpcs.phar

RUN apk --no-cache add git \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /tmp
