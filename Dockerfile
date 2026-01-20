# syntax = docker/dockerfile:1

FROM ruby:3.4.7-slim

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libpq-dev \
    libvips \
    libyaml-dev \
    libxml2-dev \
    libxslt1-dev \
    pkg-config \
    curl \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set working directory
WORKDIR /rails

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 1

# Copy application code
COPY . .

# Set execute permissions for bin files
RUN chmod +x bin/docker-entrypoint

# Precompile assets (for production)
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# Create a non-root user
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /rails

USER rails:rails

# Entrypoint prepares the database
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]