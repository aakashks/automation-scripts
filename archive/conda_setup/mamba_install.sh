# removing existing conda installation
# sudo rm -rf /opt/conda
# sudo rm -rf /usr/local/bin/conda

# # installing miniforge
# wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
# bash Miniforge3.sh -b -p "${HOME}/conda"
# rm Miniforge3.sh
# echo 'source "${HOME}/conda/etc/profile.d/conda.sh"' >> ~/.bashrc
# # For mamba support also run the following command
# echo 'source "${HOME}/conda/etc/profile.d/mamba.sh"' >> ~/.bashrc
# conda activate base


# "${SHELL}" <(curl -L micro.mamba.pm/install.sh) -p "${HOME}/micromamba" -

# micromamba installation
cd ~
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
./bin/micromamba shell init -s bash -p ~/micromamba
echo 'alias conda=micromamba' >> ~/.bashrc
micromamba config append channels conda-forge
micromamba config set channel_priority strict
source ~/.bashrc
