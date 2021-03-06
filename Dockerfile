FROM ruby:2.6.3
ENV LANG C.UTF-8
RUN apt-get update -qq && \
    apt-get install -y build-essential \
            libpq-dev \
            nodejs
RUN mkdir /app
RUN mkdir /app/src
ENV APP_ROOT /app/src
WORKDIR $APP_ROOT
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install
ADD . $APP_ROOT
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
