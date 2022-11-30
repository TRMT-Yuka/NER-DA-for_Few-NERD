python3 token-classification/run_ner_gpu0.py \
  --model_name_or_path bert-base-uncased \
  --num_train_epochs 10 \
  --return_entity_level_metrics true \
  --train_file data/TreePos_BI_x2/train.json \
  --validation_file data/TreePos_BI_x2/dev.json \
  --output_dir model/bacth10/TreePos_BI_x2 \
  --do_train \
  --do_eval