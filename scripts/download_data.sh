
#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

wget https://files.ifi.uzh.ch/cl/archiv/2019/mt19/train.de -P $data
wget https://files.ifi.uzh.ch/cl/archiv/2019/mt19/train.en -P $data

wget https://files.ifi.uzh.ch/cl/archiv/2019/mt19/dev.de -P $data
wget https://files.ifi.uzh.ch/cl/archiv/2019/mt19/dev.en -P $data

wget https://files.ifi.uzh.ch/cl/archiv/2019/mt19/test.de -P $data

# sizes
echo "Sizes of corpora:"
for corpus in train dev; do
	echo "corpus: "$corpus
	wc -l $data/$corpus.de $data/$corpus.en
done

echo "corpus: test"
wc -l $data/test.de

# sanity checks
echo "At this point, please make sure that 1) number of lines are as expected, 2) language suffixes are correct and 3) files are parallel"
