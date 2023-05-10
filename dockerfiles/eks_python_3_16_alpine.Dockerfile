FROM python:alpine3.16
RUN echo -e "\033[0;34mnode_python_base image Python version is: $(python3 -v)\033[0m"

# Update & install nodemon package
RUN apk add --update npm
RUN npm install -g nodemon > /dev/null

# Create folder /amo
RUN mkdir /amo
RUN chown node /amo

# Run server as non-privileged
# `node` user can read/write on local
USER python
WORKDIR /amo

# Copy requirements.txt and install
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy source to image:
# --- services
COPY ./services ./services

