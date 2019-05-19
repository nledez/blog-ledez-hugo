#!/bin/bash
HUGO_VERSION="0.55.6"
PLATFORM=$(uname -s)
if [ "${PLATFORM}" = "Darwin" ]; then
	HUGO_ARCH="macOS-64bit"
fi
if [ "${PLATFORM}" = "Linux" ]; then
	HUGO_ARCH="Linux-64bit"
fi
BASE_DIR=$(dirname $0)
cd ${BASE_DIR}

HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz"

if [ ! -d bin/ ]; then
	mkdir bin
fi

if [ ! -d bin/${HUGO_VERSION} ]; then
	mkdir bin/${HUGO_VERSION}
fi

if [ ! -f bin/${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz ]; then
	wget -O bin/${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz ${HUGO_URL}
fi

if [ ! -f bin/${HUGO_VERSION}/hugo ]; then
	tar xvzf bin/${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz -C bin/${HUGO_VERSION}/
fi

ln -s -f ${HUGO_VERSION}/hugo bin/hugo

if [ ! -d .venv ]; then
	virtualenv -p $(which python3) .venv
fi

./.venv/bin/pip install -r python_requirements.txt
