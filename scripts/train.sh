#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

mkdir -p $base/models

num_threads=5
model_name=model_bpe25k_batch20_epochs10

##################################

OMP_NUM_THREADS=$num_threads CUDA_VISIBLE_DEVICES=0 daikon train \
	--source $base/data/train.bpe.de \
	--target $base/data/train.bpe.en

