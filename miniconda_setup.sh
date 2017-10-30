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

echo "# Creating conda environemnts"
conda create -y -n py3 python=3
conda create -y -n py2 python=2 

echo "# Installing jupyter"
conda install -y jupyter

echo "# Installing nb_conda"
conda install -y nb_conda

echo "# Installing  notebook extensions"
echo "#> this next part is needed to avoid 'Jupter already running' error"
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --sys-prefix --skip-running-check

echo "# Installing R-base"
conda install -y -c r r-base
conda install -n py2 -y -c r r-base
conda install -n py3 -y -c r r-base


echo "# Installing kernels"
echo "## Adding kernels for conda environments"
conda install -y -n py2 ipykernel nb_conda
conda install -y -n py3 ipykernel nb_conda

echo "## Installing rpy2"
conda install -y -c r rpy2
conda install -y -n py2 -c r rpy2
conda install -y -n py3 -c r rpy2

echo "## Installing irkernel"
conda install -y -c r r-irkernel
conda install -y -n py2 -c r r-irkernel
conda install -y -n py3 -c r r-irkernel


echo "# Installing env-specific software"
echo "## Installing pandas"
conda install -y -n py2 pandas
conda install -y -n py3 pandas

echo "## Installing QIIME"
echo "### Installing QIIME v1 in py2 env"
conda install -y -n py2 -c bioconda qiime
echo "### Installing QIIME v2 in py3 env"
conda install -y -n py3 -c qiime2 qiime2


echo "# Installing R packages via install.packages()"
Rscript tidyverse_install.R
echo "## Installing R packages in py2 env"
source activate py2
#Rscript irkernel_install.R
Rscript tidyverse_install.R
echo "## Installing R packages in py3 env"
source activate py3
#Rscript irkernel_install.R
Rscript tidyverse_install.R

echo "## Installing nbextension for each environment"
echo "##> This is in case notebook is started with particular environment"
source activate py2
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --sys-prefix --skip-running-check
source activate py3
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --sys-prefix --skip-running-check


