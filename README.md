conda install & setup
=====================

This repo includes scripts for installation of conda
and setup of some basic conda environments:

* py2 = python2
* py3 = python3


# Installation & setup

## Install miniconda & create conda environments

`./miniconda_setup.sh`

## (optional) Install & configure RISE for creating Jupyter presentations

`./RISE_setup.sh`


# Renaming environments

You can't rename, but you can clone (copy) and then delete the old environment.

Example changing "py3" environment to "PROJECT_POOP":

``` bash
conda create --name PROJECT_POOP --clone py3
conda remove --name py3 --all
```