conda install & setup
=====================

This repo includes scripts for installation of conda
and setup of some basic conda environments:

* `py2` = Python2 environment with QIIME
* `py3` = Python3 environment 

All environments include:

* Jupyter
* IRkernel 
* tidyverse R packages
* phyloseq R package


# Installation & setup

## Install miniconda & create conda environments

`./miniconda_setup.sh`

> Note: miniconda will be installed in the *parent* directory

## (optional) Install & configure RISE for creating Jupyter presentations

`./RISE_setup.sh`


# Renaming environments

You can't rename, but you can clone (copy) and then delete the old environment.

Example changing "py3" environment to "PROJECT_POOP":

``` bash
conda create --name PROJECT_POOP --clone py3
conda remove --name py3 --all
```