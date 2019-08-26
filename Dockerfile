FROM arm32v7/alpine:3.10

WORKDIR /opt

RUN apk add --no-cache gcc musl-dev python-dev py2-pip libffi-dev openssl-dev && \
    pip install pyopenssl && \
    apk del py2-pip gcc musl-dev python-dev libffi-dev openssl-dev

RUN apk add --no-cache python2 py2-lxml openssl

RUN apk add --no-cache git && \
    git clone --depth 1 https://github.com/CouchPotato/CouchPotatoServer.git

VOLUME /root/.couchpotato /media/Movies

EXPOSE 5050

ENTRYPOINT ["python"]
CMD ["CouchPotatoServer/CouchPotato.py"]