FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates curl git xz-utils \
       build-essential libssl-dev libreadline-dev zlib1g-dev \
       libyaml-dev libffi-dev libgdbm-dev libncurses5-dev \
       libxml2-dev libxslt1-dev \
       nodejs npm \
    && rm -rf /var/lib/apt/lists/*

ENV RBENV_ROOT=/usr/local/rbenv
ENV PATH=/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN git clone --depth 1 https://github.com/rbenv/rbenv.git "${RBENV_ROOT}" \
    && git clone --depth 1 https://github.com/rbenv/ruby-build.git "${RBENV_ROOT}/plugins/ruby-build" \
    && rbenv install 2.7.8 \
    && rbenv global 2.7.8 \
    && rbenv rehash \
    && gem install bundler -v 1.17.3 --no-document \
    && ln -sf "${RBENV_ROOT}/shims/ruby" /usr/local/bin/ruby \
    && ln -sf "${RBENV_ROOT}/shims/gem" /usr/local/bin/gem \
    && ln -sf "${RBENV_ROOT}/shims/bundle" /usr/local/bin/bundle

RUN useradd -m -s /bin/bash ubuntu \
    && chown -R ubuntu:ubuntu /usr/local/rbenv

USER ubuntu
