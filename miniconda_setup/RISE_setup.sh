#!/bin/bash

# RISE for presentations
#conda install -c damianavila82 rise

## RISE configure

python - <<EOF
from traitlets.config.manager import BaseJSONConfigManager
path = "/ebio/abt3_projects/small_projects/nyoungblut/dev/data_analysis_workshops/miniconda3/etc/jupyter/nbconfig/"
cm = BaseJSONConfigManager(config_dir=path)
cm.update('livereveal', {
              'transition' : 'linear',
              'start_slideshow_at': 'selected',
              'scroll' : True
})

EOF
