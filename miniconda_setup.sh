#!/bin/bash
# miniconda install & setup


LOG="miniconda_setup.log"
echo ""
echo "NOTE: install log written to: "$LOG
echo ""
echo "#-- miniconda_setup.sh log --#" > $LOG

# paraent directory (install directory)
PARENT_DIR=$(dirname `pwd`)
INSTALL_DIR=$PARENT_DIR"/miniconda3"
CONDA_PATH=$INSTALL_DIR"/bin"

# download
echo "# Downloading miniconda" | tee -a $LOG
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

# install
echo "# Running miniconda installer" | tee -a $LOG
bash Miniconda3-latest-Linux-x86_64.sh -b -p $INSTALL_DIR 2>> $LOG 1>&2
## delete installer
rm -f Miniconda3-latest-Linux-x86_64.sh

# no backups
echo "# Adding no backups to miniconda directory" | tee -a $LOG
touch $INSTALL_DIR"/DO_NOT_BACKUP_THIS_FOLDER" 2>> $LOG 1>&2

# add conda to PATH
echo "# Adding conda to PATH" | tee -a $LOG
export PATH=$CONDA_PATH:$PATH

echo "# Creating conda environemnts" | tee -a $LOG
conda create -q -y -n py3 python=3 2>> $LOG 1>&2
conda create -q -y -n py2 python=2 2>> $LOG 1>&2

echo "# Installing jupyter" | tee -a $LOG
conda install -q -y jupyter 2>> $LOG 1>&2

echo "# Installing nb_conda" | tee -a $LOG
conda install -q -y nb_conda 2>> $LOG 1>&2

echo "# Installing  notebook extensions" | tee -a $LOG
echo "#> this next part is needed to avoid 'Jupter already running' error"
pip install jupyter_contrib_nbextensions 2>> $LOG 1>&2
jupyter contrib nbextensions install --sys-prefix --skip-running-check 2>> $LOG 1>&2

echo "# Installing kernels" | tee -a $LOG
echo "## Adding kernels for conda environments" | tee -a $LOG
conda install -q -y -n py2 ipykernel nb_conda 2>> $LOG 1>&2
conda install -q -y -n py3 ipykernel nb_conda 2>> $LOG 1>&2

echo "# Installing R-base" | tee -a $LOG
conda install -q -y -c r r-base 2>> $LOG 1>&2
conda install -q -y -n py2 -c r r-base 2>> $LOG 1>&2
conda install -q -y -n py3 -c r r-base 2>> $LOG 1>&2

echo "## Installing rpy2" | tee -a $LOG
conda install -q -y -c r rpy2 2>> $LOG 1>&2
conda install -q -y -n py2 -c r rpy2 2>> $LOG 1>&2
conda install -q -y -n py3 -c r rpy2 2>> $LOG 1>&2

echo "## Installing irkernel" | tee -a $LOG
conda install -q -y -c r r-irkernel 2>> $LOG 1>&2
conda install -q -y -n py2 -c r r-irkernel 2>> $LOG 1>&2
conda install -q -y -n py3 -c r r-irkernel 2>> $LOG 1>&2


echo "# Installing env-specific software" | tee -a $LOG
echo "## Installing pandas" | tee -a $LOG
conda install -q -y -n py2 pandas 2>> $LOG 1>&2
conda install -q -y -n py3 pandas 2>> $LOG 1>&2

echo "## Installing QIIME" | tee -a $LOG
echo "### Installing QIIME v1 in py2 env" | tee -a $LOG
conda install -q -y -n py2 -c bioconda qiime 2>> $LOG 1>&2
echo "### Installing QIIME v2 in py3 env" | tee -a $LOG
conda install -q -y -n py3 -c qiime2 qiime2 2>> $LOG 1>&2


echo "# Installing R packages via install.packages()" | tee -a $LOG
Rscript tidyverse_install.R 2>> $LOG 1>&2
echo "## Installing R packages in py2 env" | tee -a $LOG
source activate py2
#Rscript irkernel_install.R
Rscript tidyverse_install.R 2>> $LOG 1>&2
echo "## Installing R packages in py3 env" | tee -a $LOG
source activate py3
#Rscript irkernel_install.R
Rscript tidyverse_install.R 2>> $LOG 1>&2

echo "## Installing nbextension for each environment" | tee -a $LOG
echo "##> This is in case notebook is started with particular environment" | tee -a $LOG
source activate py2
pip install jupyter_contrib_nbextensions 2>> $LOG 1>&2
jupyter contrib nbextensions install --sys-prefix --skip-running-check 2>> $LOG 1>&2
source activate py3
pip install jupyter_contrib_nbextensions 2>> $LOG 1>&2
jupyter contrib nbextensions install --sys-prefix --skip-running-check 2>> $LOG 1>&2


