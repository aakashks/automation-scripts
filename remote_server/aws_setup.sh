conda init bash
echo "conda activate pytorch" >> ~/.bashrc
echo "alias ll='ls -hlAF'" >> ~/.bashrc
source ~/.bashrc
pip install uv
uv pip install gpustat
uv pip install langchain langchain-community langgraph langchain-huggingface transformers wandb
