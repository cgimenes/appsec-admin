FROM ruby:slim-stretch

MAINTAINER Marcelo Gimenes de Oliveira

# Configure timezone
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Install build dependencies
RUN apt-get update \
	&& apt-get install -y build-essential default-libmysqlclient-dev

WORKDIR /usr/src/app

# Copy Gemfile for easier caching of gems
COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install --without development test

# Copy application
COPY . .

EXPOSE 80

ENTRYPOINT ["rails", "s", "-e", "production", "-b", "0.0.0.0", "-p", "80"]
