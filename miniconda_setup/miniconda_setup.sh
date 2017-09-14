#!/bin/bash
# miniconda install & setup


# download
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

# install
bash Miniconda3-latest-Linux-x86_64.sh -b -p `pwd`"/miniconda3"
## delete installer
rm -f Miniconda3-latest-Linux-x86_64.sh

# no backups
touch ./miniconda3/DO_NOT_BACKUP_THIS_FOLDER

# add conda to PATH
CONDA_PATH=`pwd`"/miniconda3/bin"
export PATH=$CONDA_PATH:$PATH

# create conda environemnts
conda create -y -n py3 python=3
conda create -y -n py2 python=2 

# install essential packages into root environment

## jupyter
conda install -y jupyter

## nb_conda
conda install -y nb_conda

### this next part is needed to avoid "Jupter already running" error
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --sys-prefix --skip-running-check

# installing kernels

## adding kernels for conda environments

conda install -y -n py2 ipykernel nb_conda
conda install -y -n py3 ipykernel nb_conda

## installing R kernel

conda install -y -c r rpy2
conda install -y -n py2 -c r rpy2
conda install -y -n py3 -c r rpy2

conda install -y -c r r-irkernel
conda install -y -n py2 -c r r-irkernel
conda install -y -n py3 -c r r-irkernel

# installing env-specific software

## installing pandas

conda install -y -n py2 pandas
conda install -y -n py3 pandas

## installing qiime

conda install -y -n py2 -c bioconda qiime

# installing R packages

## tidyverse
source activate py2
Rscript tidyverse_install.R
source activate py3
Rscript tidyverse_install.R

## phyloseq
source activate py2
Rscript bioconductor_install.R
source activate py3
Rscript bioconductor_install.R

