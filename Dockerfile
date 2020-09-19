FROM ubuntu:trusty
RUN sudo apt-get -y update
RUN sudo apt-get -y upgrade
RUN sudo apt-get install -y sqlite3 libsqlite3-dev

FROM ruby:2.6.3
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client yarn
RUN mkdir /PhotoSite
WORKDIR /PhotoSite
COPY Gemfile /PhotoSite/Gemfile
COPY Gemfile.lock /PhotoSite/Gemfile.lock
COPY package.json /PhotoSite/package.json
COPY yarn.lock /PhotoSite/yarn.lock
RUN gem install bundler -v '2.0.2'

RUN bundle install


COPY . /PhotoSite
EXPOSE 3000
RUN apt-get install --no-install-recommends yarn
RUN yarn install --check-files
CMD ["rails", "server", "-b", "0.0.0.0"]