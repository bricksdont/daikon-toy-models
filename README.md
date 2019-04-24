# daikon-toy-models

This repo provides sample code that eventually trains a toy daikon model. It downloads and installs all software and data, preprocesses data and trains a model. After that, there is a script that demonstrates how evaluation typically works.

This will train a **toy** model that does not output meaningful translations. All commands assume training and translation should run on **GPU**, rather than **CPU**. If you do not have access to a GPU, training a daikon model is not feasible.

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the commands `python3` and `pip3` must be available

# Steps

Clone this repository in the desired place:

    git clone https://github.com/bricksdont/daikon-toy-models
    cd daikon-toy-models

Download and install required software:

    ./scripts/download_install_packages.sh

Download and split data:

    ./scripts/download_data.sh

Preprocess data:

    ./scripts/preprocess.sh

Then finally train a model:

    ./scripts/train.sh

Evaluate a trained model with

    ./scripts/evaluate.sh
