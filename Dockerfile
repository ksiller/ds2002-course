FROM alpine/mongosh:latest
LABEL maintainer="Karsten Siller <khs3z@virginia.edu>"

ARG USERNAME=myuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG GROUPNAME=mygroup
ENV TZ=America/New_York

# Install base packages and create user
RUN apk add --no-cache shadow sudo bash \
  && if getent group ${USER_GID} >/dev/null 2>&1; then \
       EXISTING_GROUP=$(getent group ${USER_GID} | cut -d: -f1); \
       if ! getent passwd ${USERNAME} >/dev/null 2>&1 && ! getent passwd ${USER_UID} >/dev/null 2>&1; then \
         adduser -G ${EXISTING_GROUP} -u ${USER_UID} ${USERNAME} -D -s /bin/bash; \
       fi; \
     else \
       addgroup -g ${USER_GID} ${GROUPNAME} && \
       if ! getent passwd ${USERNAME} >/dev/null 2>&1 && ! getent passwd ${USER_UID} >/dev/null 2>&1; then \
         adduser -G ${GROUPNAME} -u ${USER_UID} ${USERNAME} -D -s /bin/bash; \
       fi; \
     fi \
  && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

# Ensure the user is in the docker group for DinD (group will be created by docker-in-docker feature)
RUN addgroup -S docker 2>/dev/null || true && \
    if getent passwd ${USERNAME} >/dev/null 2>&1; then \
      adduser ${USERNAME} docker || true; \
    fi

# Install system dependencies and tools
# Essential: Python, build tools, and CLI utilities used in labs/exercises
RUN apk add --no-cache \
  python3 py3-pip python3-dev \
  curl wget git \
  nano \
  jq zip unzip \
  httpie \
  tzdata \
  htop \
  iputils \
  redis \
  pkgconfig \
  ca-certificates \
  gcc g++ musl-dev \
  libffi-dev \
  mariadb-dev \
  linux-headers \
  && ln -sf /usr/bin/python3 /usr/bin/python \
  && mkdir -p "/home/host"

# Note: mongosh is already installed in the base alpine/mongosh image

WORKDIR /root
COPY requirements.txt requirements.txt

# Upgrade pip and install build dependencies before installing packages
# Note: --break-system-packages is needed for Alpine's externally-managed Python (PEP 668)
# This is safe in Docker containers where we control the environment
RUN python3 -m pip install --break-system-packages --upgrade pip setuptools wheel

# Install Python packages
# Install build dependencies for packages that need compilation (matplotlib, pandas, mysqlclient)
RUN apk add --no-cache --virtual .build-deps \
  freetype-dev \
  libpng-dev \
  openblas-dev \
  && apk add --no-cache \
  freetype \
  libpng \
  openblas \
  && python3 -m pip install --break-system-packages --no-cache-dir -r requirements.txt \
  && apk del .build-deps
