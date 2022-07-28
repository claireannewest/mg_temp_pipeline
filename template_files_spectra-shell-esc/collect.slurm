#!/bin/bash
#SBATCH --job-name=collect
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=4G
#SBATCH --output=slurm-%j.out

bash collect_cross_secs.sh
