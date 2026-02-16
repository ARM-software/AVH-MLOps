add-apt-repository ppa:deadsnakes/ppa
apt update && apt install python3 python3-dev python3-distutils python3-venv python3-pip -y
pip3 install "setuptools_scm[toml]<6" wheel
pip3 install ethos-u-vela --no-build-isolation --no-cache-dir
apt-get install -y --no-install-recommends libpython3.9
