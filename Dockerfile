FROM ppc64le/node:14-buster

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
     tini \
     vim.tiny \
     python-pip \
     python3-pip

RUN pip3 install jupyter

RUN npm install -g code-server --unsafe-perm

COPY entrypoint.sh /usr/bin/entrypoint.sh

EXPOSE 50080

USER node

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:50080", "."]
