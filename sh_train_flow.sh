# Copyright 2020 The HuggingFace Team. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# source run_train.sh 1 filenameのようにして使用


python3 token-classification/run_ner.py \
  --model_name_or_path bert-base-uncased \
  --num_train_epochs 10 \
  --return_entity_level_metrics true \
  --train_file data/$1/train.json \
  --validation_file data/$1/dev.json \
  --output_dir model/bacth10/$1 \
  --do_train \
  --do_eval
