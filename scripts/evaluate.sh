#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data
translations=$base/translations
bleu=$base/bleu

mkdir -p $translations
mkdir -p $bleu

src=de
trg=en

# cloned from https://github.com/bricksdont/moses-scripts
MOSES=$base/tools/moses-scripts/scripts

model_name=model_bpe25k_batch20_epochs5
num_threads=5

##########################################

for corpus in dev test; do

	OMP_NUM_THREADS=$num_threads CUDA_VISIBLE_DEVICES=0 daikon translate \
				-i $data/$corpus.bpe.$src \
				-o $translations/$corpus.bpe.$model_name.$trg \
				-m $base/models/$model_name

	# undo BPE

	cat $translations/$corpus.bpe.$model_name.$trg | sed 's/\@\@ //g' > $translations/$corpus.truecased.$model_name.$trg

	# undo truecasing

	cat $translations/$corpus.truecased.$model_name.$trg | $MOSES/recaser/detruecase.perl > $translations/$corpus.tokenized.$model_name.$trg

	# undo tokenization

	cat $translations/$corpus.tokenized.$model_name.$trg | $MOSES/tokenizer/detokenizer.perl -l $trg > $translations/$corpus.$model_name.$trg

	# compute case-sensitive BLEU on detokenized data

	cat $translations/$corpus.$model_name.$trg | sacrebleu $data/$corpus.$trg > $bleu/$corpus.$model_name.bleu

	# to stdout
	echo "$translations/$corpus.$model_name.$trg":
	cat $bleu/$corpus.$model_name.bleu

done
