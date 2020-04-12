#!/bin/bash
# all.sh

#install some libraries
pip install gdown

#install dataset-tools
git clone https://github.com/dvschultz/dataset-tools
cd dataset-tools
pip install -r requirements.txt
cd ../

#set up stylegan2 repos
mkdir dvschultz-stylegan2
mkdir skyflynil-stylegan2
mkdir pbaylies-stylegan2

#install dvschultz
cd dvschultz-stylegan2
git clone https://github.com/dvschultz/stylegan2
cd stylegan2
pip install -r requirements.txt
mkdir pkl 
mkdir results
mkdir datasets
cd pkl
gdown --id 1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF #inception: https://drive.google.com/open?id=1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF
cd ../
mkdir results/00000-pretrained
cd results/00000-pretrained
gdown --id 1UlDmJVLLnBD9SnLSMXeiZRO6g-OMQCA_
mv stylegan2-ffhq-config-f.pkl network-snapshot-10000.pkl
cd ../../


#install skyflynil
cd ../../skyflynil-stylegan2
git clone https://github.com/skyflynil/stylegan2
cd stylegan2
mkdir pkl
mkdir datasets
mkdir results
cd pkl
gdown --id 1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF #inception: https://drive.google.com/open?id=1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF
cd ../
mkdir results/00000-pretrained
cd results/00000-pretrained
gdown --id 1UlDmJVLLnBD9SnLSMXeiZRO6g-OMQCA_
mv stylegan2-ffhq-config-f.pkl network-snapshot-10000.pkl
cd ../../


#install pbaylies
cd ../../pbaylies-stylegan2
git clone https://github.com/pbaylies/stylegan2
cd stylegan2
mkdir pkl
mkdir datasets
cd pkl
gdown --id 1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF #inception: https://drive.google.com/open?id=1JLqXE5bGZnlu2BkbLPD5_ZxoO3Nz-AvF
cd ../
cd ../../



