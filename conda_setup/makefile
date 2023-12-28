create_and_activate_environment:
	conda env create -f env_template.yml
	conda activate py311

pytorch_install:
	# installing pytorch
	conda install -y pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia

remaining_packages_install:
	## after installing pytorch (packages with pytorch dependency)
	conda install -y lightning transformers timm -c conda-forge