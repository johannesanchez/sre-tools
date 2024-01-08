# List of Tools needed by SRE in the Local

### SRE tools to install on Mac
# Download and install the script from Github repository
/bin/bash -c "$(curl -sSL https://raw.githubusercontent.com/johannesanchez/sre-tools/main/sre_tools.sh)"


### ktool
# ktool helps to run a predefined commands to retrieve the status of k8s services

# 1. Install ktool and k8s aliases
# ./install_ktool.sh

# 2. use ktool
# ktool {service_name} {cluster_prefix}   , example: ktool myapp rq1
