# it is always best to create from a complete script only

conda create -n temp python=3.11 -y
conda activate temp

# you must first install pytorch only
# check cuda version: 
nvcc -V

# on paramganga you must use cuda <= 11.8 so download pytorch-cuda=11.8
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
# conda install pytorch torchvision pytorch-cuda=11.8 -c pytorch -c nvidia -y

# uv for pip libraries
pip install uv
uv pip install jupyterlab seaborn timm gpustat einops

# uv pip install whatever else you wish to
#   - transformers
#	- wandb

# many libraries like llama-cpp-python need latest GLIBC versions, so check ldd --version
ldd --version
