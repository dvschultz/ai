# Instructions for installing StyleGAN2 libraries on GCP

## Set up Anaconda
`wget -c https://repo.continuum.io/archive/Anaconda3-2020.02-Linux-x86_64.sh`
`bash Anaconda3-version.num-Linux-x86_64.sh`
`rm Anaconda3-2020.02-Linux-x86_64.sh`
`exec bash`
`conda create --name stylegan python=3.7`
`conda activate stylegan`

## Install Repositories


## Run StyleGAN2 test
`cd dvschultz-stylegan2/stylegan2`
`python run_generator.py generate-images --network=./results/00000-pretrained/network-snapshot-10000.pkl --seeds=6600-6625 --truncation-psi=0.5`
