FROM ruby:3.2.0

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt update \
    && apt install -y build-essential mariadb-client nodejs \
    && npm install -g yarn
COPY Gemfile ./
RUN bundle install