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

echo token-classification/run_ner_gpu$1
echo data/$2/train.json

python3 token-classification/run_ner_gpu$1 \
  --model_name_or_path bert-base-uncased \
  --train_file data/$2/train.json \
  --validation_file data/$2/dev.json \
  --output_dir model/$2 \
  --do_train \
  --do_eval
