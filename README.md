# sockeye-toy-models

This repo provides sample code that eventually trains a toy Sockeye model. It downloads and installs all software and data, preprocesses data and trains a model. After that, there is a script that demonstrates how evaluation typically works.

This will train a **toy** model that does not output meaningful translations. All commands assume training and translation should run on **CPU**, rather than **GPU**. If you have a multicore machine, consider increasing `num_threads` in the scripts.

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/bricksdont/sockeye-toy-models
    cd sockeye-toy-models

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/download_install_packages.sh

Download and split data:

    ./scripts/download_split_data.sh

Preprocess data:

    ./scripts/preprocess.sh

Then finally train a model:

    ./scripts/train.sh

The training process can be interrupted at any time. Interrupted trainings can usually be continued from the point where they left off.

Evaluate a trained model with

    ./scripts/evaluate.sh
