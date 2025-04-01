#!/bin/sh
set -e

usage() {
  echo "usage: $0 DATASET"
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

DATASET=$1
TRAIN_DIR=train
EXAMPLES_DIR=data/char_masks/${DATASET}

python train_ilm.py \
	experiment_${DATASET} \
	${TRAIN_DIR} \
	${EXAMPLES_DIR} \
	--seed 0 \
	--train_examples_tag train \
	--eval_examples_tag valid \
	--eval_max_num_examples 512
