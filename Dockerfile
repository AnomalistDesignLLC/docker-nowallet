FROM jfloff/alpine-python:3.6-slim
MAINTAINER Matthew Raymer <matthew.raymer@anomalistdesign.com>

WORKDIR /root

RUN apk update
RUN apk upgrade
RUN apk add --no-cache --update --upgrade git g++ python3-dev build-base py-virtualenv openssl-dev curl && rm -rf /tmp/* 
RUN pip install --upgrade pip virtualenv setuptools
RUN pip3 install virtualenvwrapper
RUN git clone https://github.com/metamarcdw/nowallet.git
RUN mkdir /root/.virtualenvs
RUN echo "VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'" >> /root/.bashrc
RUN echo "export WORKON_HOME=/root/.virtualenvs" >> /root/.bashrc
RUN echo "export PROJECT_HOME=/root/nowallet" >> /root/.bashrc
RUN echo "source /usr/bin/virtualenvwrapper.sh" >> /root/.bashrc
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

#EXPOSE 8888

#CMD ["/usr/bin/python3", "nowallet"]
