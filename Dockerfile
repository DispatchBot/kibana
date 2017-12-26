FROM docker.elastic.co/kibana/kibana:5.6.5

USER root
RUN yum update -y && yum install -y ca-certificates

RUN yum update -y && \
  yum install -y wget && \
  wget https://s3.amazonaws.com/dispatchbot-devops/ca-chain.cert.pem && \
  mv ca-chain.cert.pem /etc/pki/ca-trust/source/anchors/dispatchbot-ca-chain.cert.crt && \
  update-ca-trust force-enable && \
  update-ca-trust extract && \
  yum remove -y wget

USER kibana

COPY kibana.yml /etc/kibana/kibana.yml
