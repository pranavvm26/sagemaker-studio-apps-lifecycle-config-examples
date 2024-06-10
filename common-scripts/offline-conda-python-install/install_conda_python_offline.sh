#!/bin/bash

export LOCAL_PYTHON_ENV_PATH="/home/ec2-user/anaconda3/envs/py39"
export LOCAL_CONDA_PKG_CACHE="/home/ec2-user/conda_pkgs/"
mkdir -p $LOCAL_CONDA_PKG_CACHE
echo "Downloading packages locally..."
aws s3 cp s3://sagemaker-us-east-1-1234567890/conda-artifacts/conda-pkgs/ $LOCAL_CONDA_PKG_CACHE --recursive

echo "Creating local python39 env..."
/home/ec2-user/anaconda3/condabin/conda create --prefix $LOCAL_PYTHON_ENV_PATH --use-local $LOCAL_CONDA_PKG_CACHE* --offline

echo "Installing local py39 as a kernel!"
$LOCAL_PYTHON_ENV_PATH/bin/python3 -m ipykernel install --prefix $LOCAL_PYTHON_ENV_PATH --display-name "user-env:py39"