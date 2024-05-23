echo "alias ll='ls -hlAF'" >> ~/.bashrc
echo "alias jn='jupyter notebook --no-browser --port=8080 --NotebookApp.allow_origin='*' --NotebookApp.ip='0.0.0.0''" >> ~/.bashrc

sudo yum install -y htop

# reinstall conda if needed
conda init bash
echo "conda activate pytorch" >> ~/.bashrc
source ~/.bashrc

mkdir workspace
cd workspace

pip install uv
uv pip install gpustat
uv pip install vllm
uv pip install llama-cpp-python --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cu121
uv pip install flash-attn --no-build-isolation
uv pip install langchain langchain-community langgraph langchain-huggingface langchain-openai
uv pip install accelerate transformers bitsandbytes
jn &
