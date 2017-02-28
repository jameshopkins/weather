FROM node:7.6.0

RUN npm i -g elm@0.18.0 yarn@0.21.3

ENV APP_HOME /opt/app
RUN mkdir -p $APP_HOME

ADD . $APP_HOME

WORKDIR $APP_HOME
RUN make deps
