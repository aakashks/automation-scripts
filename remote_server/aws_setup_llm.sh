echo "alias ll='ls -hlAF'" >> ~/.bashrc
echo "alias jn='jupyter notebook --no-browser --port=8080 --NotebookApp.allow_origin='*' --NotebookApp.ip='0.0.0.0''" >> ~/.bashrc

sudo yum install -y htop

# reinstall conda if needed
sudo rm -rf /opt/conda

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

echo "export PATH=~/miniconda3/bin:$PATH" >> ~/.bashrc
~/miniconda3/bin/conda init bash
source ~/.bashrc

# create a new conda environment
conda create -n pytorch python=3.11 -y

echo "conda activate pytorch" >> ~/.bashrc
source ~/.bashrc

conda install pytorch torchvision pytorch-cuda=12.1 -c pytorch -c nvidia -y
conda install jupyterlab notebook seaborn pandas -y
# uv for pip libraries
pip install uv
uv pip install gpustat

uv pip install vllm
uv pip install llama-cpp-python --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cu121
uv pip install flash-attn --no-build-isolation
uv pip install langchain langchain-community langgraph langchain-huggingface langchain-openai
uv pip install accelerate transformers bitsandbytes

mkdir workspace
cd workspace
