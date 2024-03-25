#!/bin/bash
#PJM -L rscunit=cx
#PJM -L rscgrp=cx-small
#PJM -L node=1
#PJM -L elapse=24:00:00
#PJM -j
#PJM --mail-list teramoto@mil.doshisha.ac.jp
#PJM -m e
#PJM -o output.txt

module load gcc/8.4.0 python/3.9.2 jupyterlab/3.0.9
jupyter notebook --notebook-dir=${HOME} --ip='*' --port=8890 --no-browser --allow-root