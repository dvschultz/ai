#!/bin/bash
# all.sh

sudo apt install ffmpeg #move this to the top so nothing gets locked
pip install --user --upgrade pip

#helper tools
#gdown
pip install --user gdown

#install dataset-tools
git clone https://github.com/dvschultz/dataset-tools
pip install --user -r dataset-tools/requirements.txt

#style transfers
git clone https://github.com/dvschultz/neural-style-tf.git
cd neural-style-tf
wget http://www.vlfeat.org/matconvnet/models/imagenet-vgg-verydeep-19.mat
pip install --user -r requirements.txt
cd ../

#cycleGAN
git clone https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix
cd pytorch-CycleGAN-and-pix2pix
pip install --user -r requirements.txt
cd ../

#MUNIT
git clone https://github.com/dvschultz/MUNIT
pip install --user torch torchvision tensorboard tensorboardX PyYAML torchfile

#pix2pixHD
git clone -b video https://github.com/jctestud/pix2pixHD.git
pip install --user torch torchvision
pip install --user dominate tqdm

#stylegan
git clone https://github.com/dvschultz/stylegan2
cd stylegan2
pip uninstall tensorflow
pip install tensorflow==1.15
pip install opensimplex
mkdir pkl
cd pkl
gdown --id 1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF #inception: https://drive.google.com/open?id=1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF
cd ../
mkdir networks
cd networks
gdown --id 1UlDmJVLLnBD9SnLSMXeiZRO6g-OMQCA_
cd ../
mkdir datasets

#run a test
python run_generator.py generate-images --network=./networks/stylegan2-ffhq-config-f.pkl --seeds=6600-6625 --truncation-psi=0.5
cd ../

cd neural-style-tf
#run test
bash stylize_image.sh ./image_input/lion.jpg ./styles/kandinsky.jpg
cd ../
