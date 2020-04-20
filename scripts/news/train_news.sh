#!/bin/bash
#SBATCH --gres=gpu:1
#SBATCH --mem=12g
##SBATCH --nodelist=compute-0-7
#SBATCH -t 0

python src/main.py \
        --dataset news \
        --clean_mem_every 5 \
        --reset_output_dir \
        --classifier_dir="pretrained_classifer/news" \
        --train_src_file data/news/train.txt \
        --train_trg_file data/news/train.attr \
        --dev_src_file data/news/dev.txt \
        --dev_trg_file data/news/dev.attr \
        --dev_trg_ref data/news/dev_ref.txt \
        --src_vocab  data/news/text.vocab \
        --trg_vocab  data/news/attr.vocab \
        --d_word_vec=128 \
        --d_model=512 \
        --log_every=100 \
        --eval_every=3000 \
        --ppl_thresh=10000 \
        --eval_bleu \
        --batch_size 32 \
        --valid_batch_size 128 \
        --patience 5 \
        --lr_dec 0.5 \
        --lr 0.001 \
        --dropout 0.3 \
        --max_len 10000 \
        --seed 0 \
        --beam_size 1 \
        --word_blank 0.2 \
        --word_dropout 0.1 \
        --word_shuffle 3 \
        --cuda \
        --anneal_epoch 5 \
        --temperature 0.01 \
        --klw 0.03 \
        --max_pool_k_size 1 \
        --bt \
        --lm \
        --bt_stop_grad \
        --avg_len \

