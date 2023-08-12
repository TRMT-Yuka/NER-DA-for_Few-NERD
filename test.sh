
for i in 7 9
do
	for x in "f_small" "Simple_ALL_small" "Simple_BI_small"
	do
		touch testmake_${x}_${i}.txt
		# python3 token-classification/run_ner_gpu0.py --model_name_or_path bert-base-uncased --num_train_epochs 3 --return_entity_level_metrics true --train_file data/${x}/1to20_3-167th_${i}.json --validation_file data/f/dev.json --output_dir model/to20/${x}/${i} --overwrite_output_dir --do_train --do_eval
		# rm -r model/to20/${x}/${i}/checkpoint-**
		# python3 token-classification/run_ner_gpu0.py --model_name_or_path model/to20/${x}/${i}  --train_file data/${x}/1to20_3-167th_$i.json --validation_file data/f/dev.json --test_file data/f/test.json --output_dir result/to20/${x}/${i} --pad_to_max_length --task_name ner --do_predict --return_entity_level_metrics true
	done
done