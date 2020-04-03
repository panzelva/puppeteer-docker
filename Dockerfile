FROM node:12.16.1-slim

WORKDIR /

RUN apt-get update \
    && apt-get install -y wget gnupg  \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
# && wget --quiet https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/sbin/wait-for-it.sh \
# && chmod +x /usr/sbin/wait-for-it.sh

RUN yarn add puppeteer@2.1.1
