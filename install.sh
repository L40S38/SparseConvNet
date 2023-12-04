#!/bin/bash

#-> 1. create an conda environment
source ~/anaconda3/etc/profile.d/conda.sh
conda remove --name sparseconvnet --all -y
conda create --name sparseconvnet python=3.6 -y
conda activate sparseconvnet

#-> 2. install related library
#pip install -U pip
#pip install torch==1.3.0
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
conda install scikit-learn -y
conda install tqdm -c conda-forge -y
conda install pillow -c conda-forge -y
conda install scipy -c anaconda -y

#-> 3. run setup
rm -rf build/ dist/ sparseconvnet.egg-info sparseconvnet/SCN*.so
#sudo apt-get update
#sudo apt install g++
python setup.py develop
python examples/hello-world.py
rm -rf build/ dist/ sparseconvnet.egg-info 

#-> 4. deactivate
conda deactivate 2> /dev/null