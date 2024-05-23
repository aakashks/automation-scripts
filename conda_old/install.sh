#!/bin/bash

# well conda is not detected on the system

conda env create -f env_template.yml
conda activate py311
# installing pytorch
conda install -y pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia

## after installing pytorch (packages with pytorch dependency)
conda install -y lightning transformers timm -c conda-forge