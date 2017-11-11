#!/bin/bash
# qiime environment setup

# paraent directory (install directory)
PARENT_DIR=$(dirname `pwd`)
INSTALL_DIR=$PARENT_DIR"/miniconda3"
CONDA_PATH=$INSTALL_DIR"/bin"

# preamble
LOG="qiime_env_setup.log"
echo "#-- qiime_env_setup log --#" > $LOG

# add conda to PATH
echo "# Adding conda to PATH" | tee -a $LOG
export PATH=$CONDA_PATH:$PATH

# creating qiime environments
echo "# Creating QIIME environments" | tee -a $LOG

echo "## Creatign qiime1 env" | tee -a $LOG
PKGS="python=2.7 qiime matplotlib=1.4.3 mock nose"
conda create -q -y -n qiime1 -c bioconda $PKGS 2>> $LOG 1>&2

echo "## Creating qiime2 env" | tee -a $LOG
URL="https://data.qiime2.org/distro/core/qiime2-2017.10-conda-linux-64.txt"
conda create -q -y -n qiime2 --file $URL 2>> $LOG 1>&2
