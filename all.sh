#!/bin/bash
# all.sh

sudo apt install ffmpeg #move this to the top so nothing gets locked
pip install --user --upgrade pip

#helper tools
#gdown
pip install --user gdown

#gdrive
wget https://github.com/gdrive-org/gdrive/releases/download/2.1.0/gdrive-linux-x64
mv gdrive-linux-x64 gdrive
chmod +x gdrive

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

#pix2pixHD
git clone -b video https://github.com/jctestud/pix2pixHD.git
pip install --user torch torchvision
pip install --user dominate tqdm

#stylegan
git clone https://github.com/dvschultz/stylegan
cd stylegan
pip install --user -r requirements.txt
mkdir pkl
cd pkl
gdown --id 1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF --output inception_v3_features.pkl #inception: https://drive.google.com/open?id=1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF
gdown --id 1gbxwfHNOaGjGsLNTmmSrNA85X2VWHHOq --output vgg16_zhang_perceptual.pkl #zhang: https://drive.google.com/open?id=1gbxwfHNOaGjGsLNTmmSrNA85X2VWHHOq
cd ../
mkdir pretrained_models
cd pretrained_models
gdown --id 1MEGjdvVpUsu1jB4zrXZN7Y4kBBOzizDQ --output karras2019stylegan-ffhq-1024x1024.pkl
cd ../
mkdir datasets

#run test
python pretrained_example.py
cd ../

cd neural-style-tf
#run test
bash stylize_image.sh ./image_input/lion.jpg ./styles/kandinsky.jpg
cd ../
