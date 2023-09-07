wget https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-aarch64-arm-none-eabi.tar.xz -nv
tar xJf arm-gnu-toolchain-12.3.rel1-aarch64-arm-none-eabi.tar.xz -C $HOME
echo 'export PATH="$PATH:$HOME/arm-gnu-toolchain-12.3.rel1-aarch64-arm-none-eabi/bin"' >> ~/.bashrc
source ~/.bashrc
