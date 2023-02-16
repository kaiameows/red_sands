# this is auto generated crap that has zero chance of working
# TODO: get a real dockerfile from another project

FROM ruby-3.2.1-alpine AS builder

# Install build dependencies

RUN apk add --no-cache --virtual .build-deps \
    build-base \
    git \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    tzdata \
    yaml-dev \
    zlib-dev

# Install runtime dependencies

RUN apk add --no-cache \
    bash \
    libxml2 \
    libxslt \
    postgresql-client \
    tzdata \
    yaml \
    zlib

# Install gems

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install --without development test --jobs 4 --retry 3

COPY . .

CMD ["bundle", "exec", "rs"]