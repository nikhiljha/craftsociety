FROM ruby:2.6.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev yarn sqlite sqlite-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install --binstubs --without development test
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --non-interactive

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV NODE_ENV production
RUN apk add tzdata

COPY . .
RUN yarn cache clean
RUN rm -fr ./app/assets/stylesheets/turretcss/docs
RUN rm -fr ./app/assets/stylesheets/turretcss/turret
RUN bundle e rake assets:precompile

LABEL maintainer="Nikhil Jha <hi@nikhiljha.com>"

CMD rails db:migrate && puma -C config/puma.rb