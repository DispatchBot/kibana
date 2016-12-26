FROM kibana:5.1.1

RUN wget https://s3.amazonaws.com/dispatchbot-devops/ca-chain.cert.pem && \
  mv ca-chain.cert.pem /usr/local/share/ca-certificates/dispatchbot-ca-chain.cert.pem && \
  /usr/sbin/update-ca-certificates
