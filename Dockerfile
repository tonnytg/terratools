FROM ubuntu:22.04

WORKDIR /infra

# TFlint
RUN apt-get update && \
    apt-get install -y curl unzip git && \
    # Instalar TFLint
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash && \
    tflint --version

# Instalar Terrascan
RUN    curl -L "$(curl -s https://api.github.com/repos/tenable/terrascan/releases/latest | grep -o -E "https://.+?_Linux_x86_64.tar.gz")" > terrascan.tar.gz && \
    tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz && \
    install terrascan /usr/local/bin && rm terrascan && \
    terrascan --help

# Instalar Infracost
RUN    curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh && \
    mv /root/.infracost/bin/infracost /usr/local/bin && \
    infracost --version

