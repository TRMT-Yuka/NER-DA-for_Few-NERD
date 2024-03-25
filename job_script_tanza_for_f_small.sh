#!/bin/bash

# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_1.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/1 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_2.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/2 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_3.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/3 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_4.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/4 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_5.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/5 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_6.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/6 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_7.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/7 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_8.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/8 --overwrite_output_dir --do_train --do_eval
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f-small/labeled_small_3-167th_9.json --validation_file data/f/dev.json --output_dir model/3-167th/f-small/9 --overwrite_output_dir --do_train --do_eval


for i in 0 1 2 3 4 5 6 7 8 9
do
python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/f_small/train_3-167th_$i.json --validation_file data/f/dev.json --output_dir model/3-167th/f_small/$i --overwrite_output_dir --do_train --do_eval
rm -r model/3-167th/f_small/$i/checkpoint-**
done


# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_2.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/2 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/2/checkpoint-**
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_3.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/3 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/3/checkpoint-**
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_4.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/4 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/4/checkpoint-**
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_5.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/5 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/5/checkpoint-**
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_6.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/6 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/6/checkpoint-**
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_7.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/7 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/7/checkpoint-**
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_8.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/8 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/8/checkpoint-**
# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/TreePos_O_small/labeled_small_3-167th_9.json --validation_file data/f/dev.json --output_dir model/3-167th/TreePos_O_small/9 --overwrite_output_dir --do_train --do_eval
# rm -r model/3-167th/TreePos_O_small/9/checkpoint-**