#!/bin/bash

set -e

echo "필수 패키지 설치 중..."
sudo apt update
sudo apt install -y \
  make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl \
  llvm libncursesw5-dev xz-utils tk-dev \
  libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git

if [ ! -d "$HOME/.pyenv" ]; then
  echo "pyenv 설치 중..."
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
else
  echo "pyenv가 이미 설치되어 있습니다."
fi

# 환경 변수 설정
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

echo "Python 3.12 설치 중..."
pyenv install 3.12.0 -s

pyenv local 3.12.0

echo "✅ Python 3.12 환경 설정 완료!"

# pyenv가 정상적으로 작동하는지 확인
python --version
