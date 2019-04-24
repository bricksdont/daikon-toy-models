#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

mkdir -p $base/models
mkdir -p $base/logs

num_threads=5
model_name=model_bpe25k_batch20_epochs5

##################################

OMP_NUM_THREADS=$num_threads CUDA_VISIBLE_DEVICES=0 daikon train \
	--source $base/data/train.bpe.de \
	--target $base/data/train.bpe.en \
	--epochs 5 \
	--batch_size 20 \
	--save_to $base/models/$model_name \
	--log_to $base/logs/$model_name

