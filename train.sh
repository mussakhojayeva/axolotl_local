export OMP_NUM_THREADS=24
export MKL_NUM_THREADS=1

export WANDB_API_KEY=30bd837ea9ae343e8ccf351903239c04e0cfb3db

accelerate launch -m axolotl.cli.train examples/gemma3/gemma-3-27b-lora_v1.yml
