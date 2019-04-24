#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

tools=$base/tools
mkdir -p $tools

# download and install daikon

git clone https://github.com/ZurichNLP/daikon $tools/daikon
(cd $tools/daikon && pip3 install --no-deps --editable .)

# install BPE library

pip3 install subword-nmt

# install sacrebleu for evaluation

pip3 install sacrebleu

# install Moses scripts for preprocessing

git clone https://github.com/bricksdont/moses-scripts $tools/moses-scripts

