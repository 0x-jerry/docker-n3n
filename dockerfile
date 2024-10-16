FROM --platform=linux/amd64 ubuntu:24.10

RUN apt-get update && apt-get install python3 curl -y

WORKDIR /app

RUN curl -L https://github.com/n42n/n3n/releases/download/3.3.4/n3n_3.3.4-1_amd64.deb > n3n_3.3.4-1_amd64.deb

RUN apt install ./n3n_3.3.4-1_amd64.deb

COPY ./conf /etc/n3n

EXPOSE 7777

COPY ./src /app
ENTRYPOINT [ "sh", "entrypoint.sh" ]