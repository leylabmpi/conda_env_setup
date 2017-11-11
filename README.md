conda install & setup
=====================

> version: 0.2.0
> authors: Nick Youngblut, William Walters


This repo includes scripts for installation of conda
and setup of some basic conda environments into a project directory:

* `py2` = Python v2 environment
* `py3` = Python v3 environment

All environments include:

* Jupyter
* IRkernel 
* [optional] tidyverse R packages
* [optional] phyloseq R package

You can also create separate environments for QIIME1 & QIIME2 

These environments provide a starting point for bioinformatics analysis.
You will likely need to install other software into these environments.

> WARNING: It is recommended to always install software into paritcular environments,
not just the "root" conda environment. This way, you can isolate software, and you
will have less dependency issues. 


# Installation & setup

First clone the repo (if you are viewing this on GitHub/GitLab):

`git clone https://github.com/leylabmpi/conda_env_setup.git`

Move into the repo directory:

`cd conda_env_setup`

## Install miniconda & create conda environments

`bash miniconda_setup.sh`

> Note: miniconda will be installed in the *parent* directory, so make sure
you are cloning this repository into your project directory
(whichever project you need to setup conda for. 

## Optional items to install

### Creating QIIME (v1 & v2) environments

Especially for QIIME2, it is recommended to create separate environments just for that software.
This will prevent software version issues if you want to install other software.

To create the environments:

`bash qiime_env_setup.sh`


### Install phyloseq & microbiome R packages

The phyloseq (& microbiome) R packages are very useful for microbiome data analysis in R

For py2 environment:

`source activate py2`

`Rscript phyloseq_install.R`

For py3 environment:

`source activate py3`

`Rscript phyloseq_install.R`


### Install & configure RISE for creating Jupyter presentations

This is only needed if you'd like to make interactive presentations with Jupyter Notebooks.

`source deactivate`

`bash RISE_setup.sh`


## Adding conda to your PATH

This assumes that you are using `direnv`.

To create a .envrc file:

`bash envrc_setup.sh`

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

