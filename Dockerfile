FROM python:3.10
ENV PYTHONUNBUFFERED=1

WORKDIR /tmp

RUN apt-get update
RUN apt-get install -y xfonts-base xfonts-75dpi
RUN wget https://mirror.sit.fraunhofer.de/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1l-1ubuntu1.2_amd64.deb
RUN apt install ./libssl1.1_1.1.1l-1ubuntu1.2_amd64.deb
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb
RUN apt install ./wkhtmltox_0.12.6-1.buster_amd64.deb

RUN wkhtmltopdf --version

RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app/
COPY requirements.dev.txt /app/

RUN pip install -r requirements.txt
RUN pip install -r requirements.dev.txt

COPY . /app/
