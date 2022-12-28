FROM ruby:2.7.2
#FROM mcr.microsoft.com/devcontainers/ruby:0-3.1-bullseye

# Install Rails
RUN gem install rails webdrivers 

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains 
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev,.preview.app.github.dev,.app.github.dev"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
#install REDIS
RUN sudo apt install lsb-release
RUN curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
RUN sudo apt-get update
RUN sudo apt-get install redis

# [Optional] Uncomment this line to install additional gems.
# RUN gem install <your-gem-names-here>
RUN gem install bundler
RUN gem install foreman

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

RUN brew install postgresql
RUN brew install vips imagemagick
RUN brew install yarn
RUN brew install tmux overmind
RUN brew install stripe/stripe-cli/stripe
RUN brew bundle install --no-upgrade
RUN brew services start postgresql
RUN brew services start redis
RUN bin/setup
RUN bin/dev

# App dependencies

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends imagemagick libvips libvips-dev libvips-tools libpq-dev poppler-utils && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt

# App

WORKDIR /app
COPY ./Gemfile* /app/
COPY ./config/jumpstart/Gemfile /app/config/jumpstart/
COPY ./lib/jumpstart/ /app/lib/jumpstart/
#RUN bundle config --local without "staging production omit" && bundle install --jobs $(nproc) --retry 5
COPY package.json yarn.lock /app/
#RUN yarn install
COPY . /app

CMD ["bin/rails", "s", "-b", "0.0.0.0"]

EXPOSE 3000