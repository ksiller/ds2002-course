FROM ubuntu:22.04
LABEL maintainer="Karsten Siller <khs3z@virginia.edu>"

ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=myuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG GROUPNAME=mygroup
ENV TZ=America/New_York

# Use apk to install the shadow package
#RUN apk add --no-cache shadow
RUN groupadd --gid $USER_GID $GROUPNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME 
#RUN addgroup -g ${USER_GID} ${GROUPNAME} \
#    && adduser -G ${GROUPNAME} -u ${USER_UID} ${USERNAME} -D
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Ensure the user is in the docker group for DinD (group will be created by docker-in-docker feature)
RUN groupadd -f docker && usermod -aG docker $USERNAME

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
  python3 \
  python3-dev \
  python3-pip \
  python3-setuptools \
  nano \
  git net-tools \
  jq \
  zip \
  unzip \
  dnsutils \
  httpie \
  tzdata \
  wget \
  htop \
  iputils-ping \
  redis-server \ 
  apt-transport-https \
  pkg-config \
  ca-certificates \
  gnupg \
  gcc \
  libffi-dev \
  mysql-client \
  libmysqlclient-dev \
  && apt-get clean autoclean && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Create python symlink (Ubuntu 22.04 comes with Python 3.10)
RUN ln -sf /usr/bin/python3 /usr/bin/python \
  && mkdir -p "/home/host"

WORKDIR /root
COPY requirements.txt requirements.txt
RUN python3 -m pip install --no-cache-dir -r requirements.txt
