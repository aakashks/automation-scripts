# it is always best to create from a complete script only

conda create -n t231 python=3.11 -y
conda activate t231

# you must first install pytorch only
# check cuda version: nvcc -V
# on paramganga you must use cuda <= 11.8 so download pytorch-cuda=11.8
# assuming latest compatible cuda version

conda install pytorch torchvision pytorch-cuda=12.1 -c pytorch -c nvidia -y
conda install jupyterlab seaborn -y
# install other libraries from conda which conda resolves easily
# conda install scikit-learn -y

# uv for pip libraries
pip install uv
uv pip install timm gpustat

# uv pip install whatever else you wish to
#	- langchain langchain-community langgraph langchain-huggingface
#   - transformers
#	- wandb

# many libraries like llama-cpp-python need latest GLIBC versions, so check ldd --version
