#!/bin/bash

# RISE for presentations
conda install -c damianavila82 rise


## RISE configure
### nbconfig direcotry
PARENT_DIR=$(dirname `pwd`)
CONFIG_DIR=$PARENT_DIR"/miniconda3/etc/jupyter/nbconfig/"
### editing config
python - <<EOF
from traitlets.config.manager import BaseJSONConfigManager
path = "$CONFIG_DIR"
print("nbconfig path: {}".format(path))
cm = BaseJSONConfigManager(config_dir=path)
cm.update('livereveal', {
              'transition' : 'linear',
              'start_slideshow_at': 'selected',
              'scroll' : True
})

EOF


echo "RISE configured"
