#!/bin/bash
# miniconda install & setup

# paraent directory (install directory)
PARENT_DIR=$(dirname `pwd`)
INSTALL_DIR=$PARENT_DIR"/miniconda3"
CONDA_PATH=$INSTALL_DIR"/bin"

# download
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

# install
bash Miniconda3-latest-Linux-x86_64.sh -b -p $INSTALL_DIR
## delete installer
rm -f Miniconda3-latest-Linux-x86_64.sh

# no backups
touch $INSTALL_DIR"/DO_NOT_BACKUP_THIS_FOLDER"

# add conda to PATH
export PATH=$CONDA_PATH:$PATH

# create conda environemnts
conda create -y -n py3 python=3
conda create -y -n py2 python=2 

# install essential packages into root environment

## jupyter
conda install -y jupyter

## nb_conda
conda install -y nb_conda

## notebook extensions
### this next part is needed to avoid "Jupter already running" error
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --sys-prefix --skip-running-check

# installing kernels

## adding kernels for conda environments
conda install -y -n py2 ipykernel nb_conda
conda install -y -n py3 ipykernel nb_conda

## installing rpy2
conda install -y -c r rpy2
conda install -y -n py2 -c r rpy2
conda install -y -n py3 -c r rpy2

## installing irkernel
conda install -y -c r r-irkernel
conda install -y -n py2 -c r r-irkernel
conda install -y -n py3 -c r r-irkernel


# installing env-specific software
## installing pandas
conda install -y -n py2 pandas
conda install -y -n py3 pandas

## installing qiime
### QIIME v1
conda install -y -n py2 -c bioconda qiime
### QIIME v2
conda install -y -n py3 -c qiime2 qiime2


# installing R packages
## py2
source acitvate py2
Rscript irkernel_install.R
Rscript tidyverse_install.R

source acitvate py3
Rscript irkernel_install.R
Rscript tidyverse_install.R

## nbextension for each environment (in case notebook is started with particular environment)
source activate py2
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --sys-prefix --skip-running-check
source activate py3
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --sys-prefix --skip-running-check
