#!/bin/bash
sudo -v
compile () {
  echo -n "checking for make support... "
  if command -v make &> /dev/null; then
    echo "yes"
    make all
  else
    echo "no"
    touch run.bash
    cat <<'EOF' > run.bash
#!/bin/bash
CC="zig cc"
INCLUDES="-I./include"
CFLAGS="-O2 -Wall"
OUT_DIR="build"
ARCHS=(
    "x86_64-linux" "x86-linux" "aarch64-linux" "arm-linux-gnueabihf"
    "x86_64-windows" "x86-windows" "wasm32-wasi" "mips-linux"
    "mipsel-linux" "powerpc-linux" "riscv64-linux" "riscv32-linux"
    "x86_64-macos" "loongarch64-linux" "s390x-linux" "aarch64-macos"
)
mkdir -p "$OUT_DIR"
for arch in "${ARCHS[@]}"; do
    echo "Configuring for: $arch"
    mkdir -p "$OUT_DIR/$arch"
    for src in *.c; do
        bin_name="${src%.c}"
        if [[ "$arch" == *"windows"* ]]; then
            output_file="$OUT_DIR/$arch/${bin_name}.exe"
        elif [[ "$arch" == *"wasm"* ]]; then
            output_file="$OUT_DIR/$arch/${bin_name}.wasm"
        else
            output_file="$OUT_DIR/$arch/${bin_name}"
        fi
        echo "  building: $src -> $output_file"
        $CC "$src" $INCLUDES $CFLAGS -target "$arch" -o "$output_file"
    done
done
EOF
    chmod +x run.bash
    ./run.bash
  fi
}
echo -n "checking for zig... "
if ! command -v zig &> /dev/null; then
  echo "no"
  echo -n "checking package manager... "
  if command -v apt &> /dev/null; then
    echo "apt"
    sudo apt update
    sudo apt install -y zig
  elif command -v dnf &> /dev/null; then
    echo "dnf"
    sudo dnf install -y zig
  elif command -v yum &> /dev/null; then
    echo "yum"
    sudo yum install -y epel-release
    sudo yum install -y zig
  elif command -v pacman &> /dev/null; then
    echo "pacman"
    sudo pacman -Syu --noconfirm zig
  elif command -v zypper &> /dev/null; then
    echo "zypper"
    sudo zypper refresh
    echo -n "checking for version of opensuse... "
    if grep -qi "tumbleweed" /etc/os-release; then
      echo "tumbleweed"
      sudo zypper --non-interactive dup
    else
      echo "leap"
      sudo zypper --non-interactive up
    fi
    sudo zypper --non-interactive install zig
  elif command -v apk &> /dev/null; then
    echo "apk"
    apk upgrade --update
    apk add zig --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community
  elif command -v snap &> /dev/null; then
    echo "snap"
    sudo snap install zig --classic
  elif command -v brew &> /dev/null; then
    echo "brew"
    brew install zig
  else
    echo "none"
    echo -n "checking for os... "
    case "$(uname -s)" in
      Linux*)     machine=linux;;
      Darwin*)    machine=macos;;
      *)          machine=unknown;;
    esac
    case "$(uname -m)" in
      x86_64*)    arch=x86_64;;
      i386*|i686*) arch=x86;;
      aarch64*|arm64*) arch=aarch64;;
      armv7*)     arch=armv7a;;
      *)          arch=unknown;;
    esac
    echo "$machine-$arch"
    echo -n "checking for curl, wget"
    if command -v curl &> /dev/null; then
      echo "curl"
      echo -n "getting latest version of zig... "
      ver=$(curl -s https://ziglang.org/download/index.json | grep -oE '"[0-9]+\.[0-9]+\.[0-9]+"' | head -n 1 | tr -d '"')
      echo ${ver}
      curl -L "https://ziglang.org/download/${ver}/zig-${machine}-${arch}-${ver}.tar.xz" -o "zig.tar.xz"
      echo -n "checking for minisign... "
      if command -v minisign &> /dev/null; then
        echo "yes"
        ZIG_PUBKEY="RWSGOq2NybS0XD4baKV+9ypyqzCWfmsD78094OX9YzH1pPh2YvN87K3H"
        curl -L "https://ziglang.org/download/${ver}/zig-${machine}-${arch}-${ver}.tar.xz.minisig" -o "zig.minisig"
        echo -n "checking for signature... "
        if minisign -Vm "zig.tar.xz" -P "$ZIG_PUBKEY"; then
          echo "yes"
          tar -xf zig.tar.xz
          FOLDER_NAME="zig-${machine}-${arch}-${ver}"
          sudo rm -rf "/usr/local/lib/zig"
          sudo mv "$FOLDER_NAME" "/usr/local/lib/zig"
          sudo ln -sf "/usr/local/lib/zig/zig" "/usr/local/bin/zig"
          rm zig.tar.xz
          compile
        else
          echo "no"
          echo "you may wish to re-execute the program"
          exit 1
        fi
      else
        echo "no"
        PLATFORM_STR="${machine}-${arch}"
        hash=$(curl -s https://ziglang.org/download/index.json | grep -A 10 "\"$ver\"" | grep -A 5 "\"$PLATFORM_STR\"" | grep "shasum" | cut -d '"' -f 4)
        echo -n "checking for signature... "
        if echo "$hash  zig.tar.xz" | sha256sum -c -; then
          echo "yes"
          tar -xf zig.tar.xz
          FOLDER_NAME="zig-${machine}-${arch}-${ver}"
          sudo rm -rf "/usr/local/lib/zig"
          sudo mv "$FOLDER_NAME" "/usr/local/lib/zig"
          sudo ln -sf "/usr/local/lib/zig/zig" "/usr/local/bin/zig"
          rm zig.tar.xz
          compile
        else
          echo "no"
          echo "you may wish to re-execute the program"
          exit 1
        fi
      fi
    elif command -v wget &> /dev/null; then
      echo "wget"
      echo -n "getting latest version of zig... "
      ver=$(wget -qO- https://ziglang.org/download/index.json | grep -oE '"[0-9]+\.[0-9]+\.[0-9]+"' | head -n 1 | tr -d '"')
      echo ${ver}
      wget "https://ziglang.org/download/${ver}/zig-${machine}-${arch}-${ver}.tar.xz" -O "zig.tar.xz"
      echo -n "checking for minisign... "
      if command -v minisign &> /dev/null; then
        echo "yes"
        ZIG_PUBKEY="RWSGOq2NybS0XD4baKV+9ypyqzCWfmsD78094OX9YzH1pPh2YvN87K3H"
        wget "https://ziglang.org/download/${ver}/zig-${machine}-${arch}-${ver}.tar.xz.minisig" -O "zig.minisig"
        echo -n "checking for signature... "
        if minisign -Vm "zig.tar.xz" -P "$ZIG_PUBKEY"; then
          echo "yes"
          tar -xf zig.tar.xz
          FOLDER_NAME="zig-${machine}-${arch}-${ver}"
          sudo rm -rf "/usr/local/lib/zig"
          sudo mv "$FOLDER_NAME" "/usr/local/lib/zig"
          sudo ln -sf "/usr/local/lib/zig/zig" "/usr/local/bin/zig"
          rm zig.tar.xz
          compile
        else
          echo "no"
          echo "you may wish to re-execute the program"
          exit 1
        fi
      else
        echo "no"
        PLATFORM_STR="${machine}-${arch}"
        hash=$(wget -qO- https://ziglang.org/download/index.json | grep -A 10 "\"$ver\"" | grep -A 5 "\"$PLATFORM_STR\"" | grep "shasum" | cut -d '"' -f 4)
        echo -n "checking for signature... "
        if echo "$hash  zig.tar.xz" | sha256sum -c -; then
          echo "yes"
          tar -xf zig.tar.xz
          FOLDER_NAME="zig-${machine}-${arch}-${ver}"
          sudo rm -rf "/usr/local/lib/zig"
          sudo mv "$FOLDER_NAME" "/usr/local/lib/zig"
          sudo ln -sf "/usr/local/lib/zig/zig" "/usr/local/bin/zig"
          rm zig.tar.xz
          compile
        else
          echo "no"
          echo "you may wish to re-execute the program"
          exit 1
        fi
      fi
    else
      echo "cannot install zig normal way. please put the zig xz tarball as zig.tar.xz for your os inside your home directory."
      if [ -f "$HOME/zig.tar.xz" ]; then
        tar -xf zig.tar.xz
        FOLDER_NAME="zig-${machine}-${arch}-*"
        sudo rm -rf "/usr/local/lib/zig"
        sudo mv "$FOLDER_NAME" "/usr/local/lib/zig"
        sudo ln -sf "/usr/local/lib/zig/zig" "/usr/local/bin/zig"
        rm zig.tar.xz
        compile
      else
        echo "not found"
        echo "you may wish to re-execute the program"
        exit 1
      fi
    fi
  fi
else
  echo "yes"
  compile
fi
