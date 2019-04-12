# Get Docker Image from Ubuntu base.
FROM ruby:2.5

# Author
LABEL="For the glory of Jesus Christ, our Saviour"

ENV APP  yeahright
ENV PORT 3000

# Create Directory
RUN mkdir /$APP

# Set current directory to your app
WORKDIR $APP


COPY Gemfile /$APP/Gemfile
COPY Gemfile.lock /$APP/Gemfile.lock
RUN bundle install

# Copy compiled ruby files to the app directory
COPY . /$APP

EXPOSE $PORT

CMD ["rails", "server", "-b", "0.0.0.0"]
