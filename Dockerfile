FROM ruby:2.7.2-alpine3.13

RUN apk update
RUN apk add \
    build-base \
    bash \
    mariadb-dev \
    tzdata \
    git

RUN gem install bundler
COPY ./Gemfile  ./
COPY ./Gemfile.lock ./

RUN if [ RAILS_ENV = "production" ] ; then bundle install --without development test; else bundle install; fi
COPY ./ ./
CMD ["bundle", "exec","puma"]
