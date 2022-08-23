#!/bin/bash
#PJM --fs sh_train_flow.sh
#PJM -L rscunit=cx
#PJM -L rscgrp=cx-small
#PJM -L node=1
#PJM -L elapse=24:00:00
#PJM -j
#PJM --mail-list teramoto@mil.doshisha.ac.jp
#PJM -m e
#PJM -o train_job_output.txt



module load gcc/8.4.0 python/3.9.2 jupyterlab/3.0.9
module load cuda/11.6.2 openmpi_cuda/4.1.2 nccl/2.12.7
export LD_LIBRARY_PATH=/home/z44712r/env39/lib64/python3.9/site-packages/:$LD_LIBRARY_PATH
source ./home/z44712r/env39/bin/activate

python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/f/train.json --validation_file data/f/dev.json --output_dir model/batch7/f --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/f_BI_x2/train.json --validation_file data/f_BI_x2/dev.json --output_dir model/batch7/f_BI_x2 --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/TreePos_BI_x2/train.json --validation_file data/TreePos_BI_x2/dev.json --output_dir model/batch7/TreePos_BI_x2 --do_train --do_eval

python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f/train.json --validation_file data/f/dev.json --output_dir model/batch3/f --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f_BI_x2/train.json --validation_file data/f_BI_x2/dev.json --output_dir model/batch3/f_BI_x2 --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_BI_x2/train.json --validation_file data/TreePos_BI_x2/dev.json --output_dir model/batch3/TreePos_BI_x2 --do_train --do_eval