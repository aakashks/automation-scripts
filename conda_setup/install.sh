#!/bin/bash

conda env create -f env_template.yml
conda activate py311
# installing pytorch
conda install -y pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia

## after installing pytorch
conda install -y lightning transformers -c conda-forge