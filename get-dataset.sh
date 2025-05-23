#!/bin/bash
set -e

usage() {
  echo "usage: $0 DATASET"
}

if [ $# -ne 1 ]; then
  usage
  echo "args $#"
  exit 1
fi

DATASET=$1

pushd data
./get_${DATASET}.sh
popd

for SPLIT in train valid
do
	python create_ilm_examples.py \
		${SPLIT} \
		data/char_masks/${DATASET} \
		--seed 0 \
		--data_name ${DATASET} \
		--data_split ${SPLIT}
done
