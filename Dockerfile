FROM ubuntu:22.04

WORKDIR /infra

RUN apt-get update && \
    apt-get install -y curl unzip git && \
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash && \
    tflint --version

RUN curl -L "$(curl -s https://api.github.com/repos/tenable/terrascan/releases/latest | grep -o -E "https://.+?_Linux_x86_64.tar.gz")" > terrascan.tar.gz && \
  tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz && \
  install terrascan /usr/local/bin && rm terrascan && \
  terrascan --help
