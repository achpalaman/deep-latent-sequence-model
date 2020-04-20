#!/bin/bash
#SBATCH --gres=gpu:1
#SBATCH --mem=12g
##SBATCH --nodelist=compute-0-7
#SBATCH -t 0

export PYTHONPATH="$(pwd)"

python src/cnn_classify.py \
  --dataset shakespeare \
  --output_dir "pretrained_classifer/shakespeare/" \
  --clean_mem_every 5 \
  --reset_output_dir \
  --train_src_file data/news/train.txt \
  --train_trg_file data/news/train.attr \
  --dev_src_file data/news/dev.txt \
  --dev_trg_file data/news/dev.attr \
  --dev_trg_ref data/news/dev.txt \
  --src_vocab  data/news/text.vocab \
  --trg_vocab  data/news/attr.vocab \
  --d_word_vec=128 \
  --d_model=512 \
  --log_every=100 \
  --eval_every=1500 \
  --out_c_list="1,2,3,4" \
  --k_list="3,3,3,3" \
  --batch_size 32 \
  --valid_batch_size=32 \
  --patience 5 \
  --lr_dec 0.8 \
  --dropout 0.3 \
  --cuda \

