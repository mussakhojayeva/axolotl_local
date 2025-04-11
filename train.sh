#!/bin/sh
#SBATCH --job-name="gemma3-27b-train"
#SBATCH --nodes=1
#SBATCH --partition=defq
#SBATCH --nodelist=node006
#SBATCH --cpus-per-task=8
#SBATCH --output="test-single-node-training-%j.out"
#SBATCH --gres=gpu:8
#SBATCH --ntasks-per-node=8
#SBATCH --time=168:00:00
# Environment variables for faster initialization
export OMP_NUM_THREADS=24
export MKL_NUM_THREADS=1

# Conda initialization
eval "$(conda shell.bash hook)"
conda activate axolotl

export WANDB_API_KEY=30bd837ea9ae343e8ccf351903239c04e0cfb3db

accelerate launch -m axolotl.cli.train examples/gemma3/gemma-3-27b-lora_v1.yml
