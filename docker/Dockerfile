FROM ruby:3.0.0

RUN apt-get update -y
RUN apt-get install -y build-essential libpq-dev

# for a JS runtime we use Node and for yarn package management
RUN curl -fsSL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN apt upgrade -y nodejs
RUN npm install -g npm
RUN npm install -g yarn

RUN apt-get install -y postgresql postgresql-contrib
RUN apt-get install -y rsync

ENV DIR /var/www

RUN mkdir $DIR
WORKDIR $DIR
ADD . $DIR

# install phantomjs
RUN curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
   | tar -C /usr/local --no-same-owner -jx \
  && ln -s /usr/local/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs \
  && which phantomjs \
  && echo "PhantomJS version $(phantomjs --version) installed"

# bundle config
ENV BUNDLE_GEMFILE=$DIR/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle \
    GEM_HOME=/bundle \
    BUNDLE_BIN=/bundle/bin \
    BUNDLE_APP_CONFIG=/bundle \
    PATH=/bundle/bin:$PATH

# bundle the gems default
RUN cp Gemfile /
RUN BUNDLE_GEMFILE=/Gemfile bundle

# forward ssh key
RUN echo "eval \`ssh-agent -s\`" >> ~/.bashrc
RUN echo "ssh-add" >> ~/.bashrc
