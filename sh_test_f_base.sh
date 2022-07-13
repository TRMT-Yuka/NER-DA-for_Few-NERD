# source run_train.sh 1 filenameのようにして使用


python3 token-classification/run_ner_gpu$1.py \
  --model_name_or_path model/$2 \
  --train_file data/$2/train.json \
  --validation_file data/$2/dev.json \
  --test_file data/f/test.json \
  --output_dir result/$2 \
  --do_predict