# it is always best to create from a complete script only

conda create -n py311 python=3.11 -y
conda activate py311

# you must first install pytorch only
# check cuda version: nvcc -V
# on paramganga you must use cuda <= 11.8
# assuming latest compatible cuda version

conda install pytorch torchvision pytorch-cuda=12.1 -c pytorch -c nvidia -y
conda install jupyterlab notebook seaborn pandas -y
# install other libraries from conda which conda resolves easily
# conda install scikit-learn -y

# uv for pip libraries
pip install uv
uv pip install gpustat

# uv pip install whatever else you wish to
#	- langchain langchain-community langgraph langchain-huggingface
#   - transformers
#	- wandb

# many libraries like llama-cpp-python need latest GLIBC versions, so check ldd --version
