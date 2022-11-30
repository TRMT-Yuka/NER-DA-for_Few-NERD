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

python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/Simple_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs3/Simple_BI_small --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/Simple_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs3/Simple_BO_small --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs3/TreePos_BI_small --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs3/TreePos_O_small --overwrite_output_dir --do_train --do_eval
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs3/Simple_BI_small --train_file data/Simple_BI_small/labeled_small.json --validation_file data/Simple_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs3/Simple_BI_small --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs3/Simple_O_small --train_file data/Simple_O_small/labeled_small.json --validation_file data/Simple_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs3/Simple_O_small --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs3/TreePos_BI_small --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/TreePos_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs3/TreePos_BI_small --do_predict --return_entity_level_metrics true
python3 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs3/TreePos_O_small --train_file data/TreePos_O_small/labeled_small.json --validation_file data/TreePos_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs3/TreePos_O_small --do_predict --return_entity_level_metrics true


python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 5 --return_entity_level_metrics true --train_file data/Simple_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs5/Simple_BI_small --overwrite_output_dir --do_train --do_eval
python5 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 5 --return_entity_level_metrics true --train_file data/Simple_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs5/Simple_BO_small --overwrite_output_dir --do_train --do_eval
python5 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 5 --return_entity_level_metrics true --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs5/TreePos_BI_small --overwrite_output_dir --do_train --do_eval
python5 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 5 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs5/TreePos_O_small --overwrite_output_dir --do_train --do_eval
python5 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs5/Simple_BI_small --train_file data/Simple_BI_small/labeled_small.json --validation_file data/Simple_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs5/Simple_BI_small --do_predict --return_entity_level_metrics true
python5 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs5/Simple_O_small --train_file data/Simple_O_small/labeled_small.json --validation_file data/Simple_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs5/Simple_O_small --do_predict --return_entity_level_metrics true
python5 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs5/TreePos_BI_small --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/TreePos_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs5/TreePos_BI_small --do_predict --return_entity_level_metrics true
python5 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs5/TreePos_O_small --train_file data/TreePos_O_small/labeled_small.json --validation_file data/TreePos_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs5/TreePos_O_small --do_predict --return_entity_level_metrics true


python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/Simple_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs7/Simple_BI_small --overwrite_output_dir --do_train --do_eval
python7 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/Simple_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs7/Simple_BO_small --overwrite_output_dir --do_train --do_eval
python7 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs7/TreePos_BI_small --overwrite_output_dir --do_train --do_eval
python7 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 7 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs7/TreePos_O_small --overwrite_output_dir --do_train --do_eval
python7 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs7/Simple_BI_small --train_file data/Simple_BI_small/labeled_small.json --validation_file data/Simple_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs7/Simple_BI_small --do_predict --return_entity_level_metrics true
python7 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs7/Simple_O_small --train_file data/Simple_O_small/labeled_small.json --validation_file data/Simple_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs7/Simple_O_small --do_predict --return_entity_level_metrics true
python7 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs7/TreePos_BI_small --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/TreePos_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs7/TreePos_BI_small --do_predict --return_entity_level_metrics true
python7 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs7/TreePos_O_small --train_file data/TreePos_O_small/labeled_small.json --validation_file data/TreePos_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs7/TreePos_O_small --do_predict --return_entity_level_metrics true


python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 10 --return_entity_level_metrics true --train_file data/Simple_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs10/Simple_BI_small --overwrite_output_dir --do_train --do_eval
python10 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 10 --return_entity_level_metrics true --train_file data/Simple_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs10/Simple_BO_small --overwrite_output_dir --do_train --do_eval
python10 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 10 --return_entity_level_metrics true --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs10/TreePos_BI_small --overwrite_output_dir --do_train --do_eval
python10 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 10 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small.json --validation_file data/f/dev.json --output_dir model/epochs10/TreePos_O_small --overwrite_output_dir --do_train --do_eval
python10 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs10/Simple_BI_small --train_file data/Simple_BI_small/labeled_small.json --validation_file data/Simple_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs10/Simple_BI_small --do_predict --return_entity_level_metrics true
python10 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs10/Simple_O_small --train_file data/Simple_O_small/labeled_small.json --validation_file data/Simple_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs10/Simple_O_small --do_predict --return_entity_level_metrics true
python10 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs10/TreePos_BI_small --train_file data/TreePos_BI_small/labeled_small.json --validation_file data/TreePos_BI_small/dev.json --test_file data/f/test.json --output_dir result/epochs10/TreePos_BI_small --do_predict --return_entity_level_metrics true
python10 token-classification/run_ner_gpu0.py --model_name_or_path model/epochs10/TreePos_O_small --train_file data/TreePos_O_small/labeled_small.json --validation_file data/TreePos_O_small/dev.json --test_file data/f/test.json --output_dir result/epochs10/TreePos_O_small --do_predict --return_entity_level_metrics true