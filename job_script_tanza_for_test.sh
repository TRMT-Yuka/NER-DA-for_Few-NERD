#!/bin/bash

# for i in 0 1 2 3 4 5 6 7 8 9
# do
# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/Simple_ALL_small/$i --train_file data/Simple_ALL_small/labeled_small_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/Simple_ALL_small/$i --do_predict --return_entity_level_metrics true
# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/Simple_BI_small/$i --train_file data/Simple_BI_small/labeled_small_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/Simple_BI_small/$i --do_predict --return_entity_level_metrics true
# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/Simple_O_small/$i --train_file data/Simple_O_small/labeled_small_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/Simple_O_small/$i --do_predict --return_entity_level_metrics true

# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/TreePos_ALL_small/$i --train_file data/TreePos_ALL_small/labeled_small_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/TreePos_ALL_small/$i --do_predict --return_entity_level_metrics true
# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/TreePos_BI_small/$i --train_file data/TreePos_BI_small/labeled_small_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/TreePos_BI_small/$i --do_predict --return_entity_level_metrics true
# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/TreePos_O_small/$i --train_file data/TreePos_O_small/labeled_small_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/TreePos_O_small/$i --do_predict --return_entity_level_metrics true
# done



# for i in 0 1 2 3 4 5 6 7 8 9
# do
# 	python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/f_small/$i --train_file data/f_small/train_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/f_small/$i --do_predict --return_entity_level_metrics true
# done


for i in 0 1 2 3 4 5 6 7 8 9
do
	python3 token-classification/run_ner_gpu0.py --model_name_or_path model/3-167th/f_small/$i --train_file data/f_small/train_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/3-167th/f_small/$i --do_predict --return_entity_level_metrics true
done
