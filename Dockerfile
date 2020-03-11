FROM nickfan/docker-ubuntu1804-base:latest

MAINTAINER Nick Fan "nickfan81@gmail.com"

ARG MIRROR_CN=true
ENV MIRROR_CN ${MIRROR_CN}
RUN if [ ${MIRROR_CN} = true ]; then \
  echo "Change Source to China Mirror Site." \
  ;fi

RUN echo ${MIRROR_CN}

ARG INSTALL_PYTHON3=true
ENV INSTALL_PYTHON3 ${INSTALL_PYTHON3}
RUN if [ ${INSTALL_PYTHON3} = true ]; then \
    apt-get install --assume-yes apt-utils -y python3 python3-dev python3-pip python3-setuptools python3-lxml python3-venv python3-wheel python3-cffi \
  ;fi

RUN if [ ${INSTALL_PYTHON3} = true ] && [ ${MIRROR_CN} != true ]; then \
  pip3 install --upgrade pip setuptools \
  ;fi

RUN if [ ${INSTALL_PYTHON3} = true ] && [ ${MIRROR_CN} = true ]; then \
  pip3 install -i https://mirrors.aliyun.com/pypi/simple/ --upgrade pip setuptools; \
  pip3 config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
  ;fi

RUN if [ ${INSTALL_PYTHON3} = true ]; then \
  pip3 install --upgrade pqi \
  ;fi

RUN if [ ${INSTALL_PYTHON3} = true ]; then \
  pip3 install --upgrade pipreqs virtualenv autoenv pipenv requests \
  ;fi
