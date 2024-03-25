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
source /home/z44712r/env39/bin/activate

# example
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f/train.json --validation_file data/f/dev.json --output_dir model/f/3/ --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/f/3/ --train_file data/f/train.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/f/3/ --do_predict --return_entity_level_metrics true

for i in 0 1 2 3 4 5 6 7 8 9
do
	for x in "f"
	do
		python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/${x}/train.json --validation_file data/f/dev.json --output_dir model/${x}/epoch3_10times/${i} --overwrite_output_dir --do_train --do_eval
		rm -r model/${x}/${i}/checkpoint-**
		python3 token-classification/run_ner_gpu0.py --model_name_or_path model/${x}/epoch3_10times/${i}  --train_file data/${x}/train.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/${x}/epoch3_10times/${i} --pad_to_max_length --task_name ner --do_predict --return_entity_level_metrics true
	done
done

# for i in 0 1 2 3 4 5 6 7 8 9
# do
# 	for x in "SubTree"
# 	do
# 		python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/${x}/${i}_x10.json --validation_file data/f/dev.json --output_dir model/${x}/${i} --overwrite_output_dir --do_train --do_eval
# 		rm -r model/${x}/${i}/checkpoint-**
# 		python3 token-classification/run_ner_gpu0.py --model_name_or_path model/${x}/${i}  --train_file data/${x}/${i}_x10.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/${x}/${i} --pad_to_max_length --task_name ner --do_predict --return_entity_level_metrics true
# 	done
# done

# for i in 0 1 2 3 4 5 6 7 8 9
# do
# 	for x in "f_small" "Simple_ALL_small" "Simple_BI_small" "Simple_O_small" "TreePos_ALL_small" "TreePos_BI_small" "TreePos_O_small"
# 	do
# 		python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/${x}/1to50_3-167th_${i}.json --validation_file data/f/dev.json --output_dir model/to20/${x}/${i} --overwrite_output_dir --do_train --do_eval
# 		rm -r model/to20/${x}/${i}/checkpoint-**
# 		python3 token-classification/run_ner_gpu0.py --model_name_or_path model/to20/${x}/${i}  --train_file data/${x}/1to50_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/to20/${x}/${i} --pad_to_max_length --task_name ner --do_predict --return_entity_level_metrics true
# 	done
# done
