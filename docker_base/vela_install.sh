add-apt-repository ppa:deadsnakes/ppa
apt update && apt install python3 python3-dev python3-distutils python3-venv python3-pip -y
pip install numpy==1.21.3 --force
pip install "setuptools_scm[toml]<6" wheel
pip3 install ethos-u-vela --no-build-isolation --no-cache-dir
apt-get install -y --no-install-recommends libpython3.9
# Basic build tools
apt-get install -y --no-install-recommends \
  build-essential \
  ninja-build \
  git \
  curl \
  wget \
  unzip \
  rsync

# ARM cross-compilation toolchain
apt-get install -y --no-install-recommends \
  gcc-arm-none-eabi \
  libnewlib-arm-none-eabi

# Additional build dependencies for ExecuTorch
apt-get install -y --no-install-recommends \
  pkg-config \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  liblzma-dev

# Additional utilities
apt-get install -y --no-install-recommends \
  vim \
  nano \
  tree

rm -rf /var/lib/apt/lists/*
