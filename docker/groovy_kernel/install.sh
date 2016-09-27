#!/bin/bash
set -e

if [ -z $1 ] ; then
    echo 'No target directory specified.'
    echo 'Usage: ./install.sh <kernel directory>'
    echo
    echo 'Where the <kernel directory> is the location the jar file'
    echo 'will be copied to.'
    exit 1
fi
set -u

mkdir jupyter-groovy-kernel
cat kernel.json | sed "s|__PATH__|$1/jupyter-groovy-kernel-1.0.0.jar|" > jupyter-groovy-kernel/kernel.json
cp jupyter-groovy-kernel-1.0.0.jar $1
jupyter kernelspec install --replace --name groovy jupyter-groovy-kernel
rm -rf jupyter-groovy-kernel
