FROM alpine
LABEL maintainer="Herald Yu <yuhr123@gmail.com>"

RUN apk add --update curl jq \
    && rm -rf /var/cache/apk/*

ENV release=
ENV FRP_SERVER_ADDR=""
ENV FRP_TOKEN=""


RUN set -x \
    && mkdir /frp \
    && cd /frp \
    && release=${release:-$(curl -s https://api.github.com/repos/fatedier/frp/releases/latest | jq -r .tag_name )} \
    && curl -s -L https://github.com/fatedier/frp/releases/download/${release}/frp_${release/v/}_linux_amd64.tar.gz \
    | tar -zx \
    && cd frp_${release/v/}_linux_amd64 \
    && cp frpc /usr/local/bin/ \
    && chmod +x /usr/local/bin/frpc \
    && mkdir /etc/frp \
    && cd .. \
    && rm -rf frp_${release/v/}_linux_amd64

COPY ./frpc.ini /etc/frp

EXPOSE 6000 7000

CMD ["frpc", "-c", "/etc/frp/frpc.ini"]
