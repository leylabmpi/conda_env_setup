#!/bin/bash

PARENT_DIR=$(dirname `pwd`)
INSTALL_DIR=$PARENT_DIR"/miniconda3"
CONDA_PATH=$INSTALL_DIR"/bin"
ENVRC=$PARENT_DIR"/.envrc"

echo export PATH=$CONDA_PATH:"\$PATH" >  $ENVRC
echo >> $ENVRC
echo >> $ENVRC
echo "# Uncomment a 'use conda ...' line below to use a particular conda environment" >> $ENVRC
echo >> $ENVRC
echo "#use conda py3" >> $ENVRC
echo "#use conda py2" >> $ENVRC
echo >> $ENVRC
echo "# group permissions for new directories" >> $ENVRC
echo "umask 0002" >> $ENVRC

echo ".envrc file created at: "$ENVRC
