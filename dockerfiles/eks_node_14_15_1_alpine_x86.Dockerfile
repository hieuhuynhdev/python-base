FROM node:14.18.1-alpine

# Skip download redis, mongodb, chromium
ENV REDISMS_DISABLE_POSTINSTALL=1
ENV MONGOMS_DISABLE_POSTINSTALL=1
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Create folder /amo
RUN mkdir /amo
RUN chown node /amo

# Run server as non-privileged
# `node` user can read/write on local
USER node
WORKDIR /amo

# Copy package.json, package-lock.json and install nodejs dependencies
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
RUN npm i

# Copy source to image:
# --- dataFiles/
# --- service_keys/
# --- services/
COPY ./dataFiles ./dataFiles
COPY ./service_keys ./service_keys
COPY ./services ./services
