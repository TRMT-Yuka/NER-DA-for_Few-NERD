#!/bin/bash

#------ pjsub option --------#

#PJM --fs test.sh
#PJM -L rscunit=cx
#PJM -L rscgrp=cx-debug
#PJM -L node=1
#PJM -L elapse=1:00:00
#PJM -j
#PJM --mail-list teramoto@mil.doshisha.ac.jp
#PJM -m b
#PJM -o train_job_poutput.txt

#------- Program execution -------# 
./a.out