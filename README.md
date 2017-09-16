conda install & setup
=====================

This repo includes scripts for installation of conda
and setup of some basic conda environments into a project directory:

* `py2` = Python2 environment with QIIME
* `py3` = Python3 environment 

All environments include:

* Jupyter
* IRkernel 
* tidyverse R packages
* phyloseq R package


# Installation & setup

First clone the repo (if you are viewing this on GitHub/GitLab):

`git clone https://github.com/leylabmpi/conda_env_setup.git`

Move into the repo directory:

`cd conda_env_setup`

## Install miniconda & create conda environments

`./miniconda_setup.sh`

> Note: miniconda will be installed in the *parent* directory, so make sure
you are cloning this repository into your project directory
(whichever project you need to setup conda for. 

## Optional items to install

### Install phyloseq R package

The phyloseq R package is very useful for microbiome data analysis in R

For py2 environment:

`source activate py2`

`Rscript phyloseq_install.R`

For py3 environment:

`source activate py3`

`Rscript phyloseq_install.R`


### Install & configure RISE for creating Jupyter presentations

This is only needed if you'd like to make interactive presentations with Jupyter Notebooks.

`source deactivate`

`./RISE_setup.sh`


## Adding conda to your PATH

This assumes that you are using `direnv`.

To create a .envrc file:

`./envrc_setup.sh`

Edit the .envrc file if needed:

`nano .envrc`



# Renaming environments

You can't rename, but you can clone (copy) and then delete the old environment.

Example changing "py3" environment to "PROJECT_POOP":

``` bash
conda create --name PROJECT_POOP --clone py3
conda remove --name py3 --all
```

# Creating & managing environments

See [Confluence](http://confluence.eb.local/display/LDU/conda+environment+notes)

