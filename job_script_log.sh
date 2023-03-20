#!/bin/bash

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

#1-167
#Simple_O
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --output_dir model/1-167th/f_small/3/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 5 --return_entity_level_metrics true --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --output_dir model/1-167th/f_small/5/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --output_dir model/1-167th/f_small/7/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 10 --return_entity_level_metrics true --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --output_dir model/1-167th/f_small/10/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/1-167th/f_small/3 --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/1-167th/f_small/3/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/1-167th/f_small/5 --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/1-167th/f_small/5/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/1-167th/f_small/7 --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/1-167th/f_small/7/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/1-167th/f_small/10 --train_file data/f_small/labeled_small_1-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/1-167th/f_small/10/ --do_predict --return_entity_level_metrics 

#2-167
#Simple_O
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --output_dir model/2-167th/f_small/3/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 5 --return_entity_level_metrics true --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --output_dir model/2-167th/f_small/5/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --output_dir model/2-167th/f_small/7/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 10 --return_entity_level_metrics true --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --output_dir model/2-167th/f_small/10/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/2-167th/f_small/3 --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/2-167th/f_small/3/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/2-167th/f_small/5 --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/2-167th/f_small/5/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/2-167th/f_small/7 --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/2-167th/f_small/7/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/2-167th/f_small/10 --train_file data/f_small/labeled_small_2-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/2-167th/f_small/10/ --do_predict --return_entity_level_metrics 

#3-167
#Simple_O
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --output_dir model/3-167th/f_small/3/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 5 --return_entity_level_metrics true --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --output_dir model/3-167th/f_small/5/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --output_dir model/3-167th/f_small/7/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 10 --return_entity_level_metrics true --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --output_dir model/3-167th/f_small/10/ --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/f_small/3 --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/f_small/3/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/f_small/5 --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/f_small/5/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/f_small/7 --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/f_small/7/ --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/f_small/10 --train_file data/f_small/labeled_small_3-167th.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/f_small/10/ --do_predict --return_entity_level_metrics 
