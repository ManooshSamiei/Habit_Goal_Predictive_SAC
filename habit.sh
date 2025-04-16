#!/bin/bash
#SBATCH --job-name=Maze
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1
#SBATCH --mem=16G
#SBATCH --time=06:00:00
#SBATCH --output=/home/mila/m/manoosh.samiei/scratch/The-Bayesian-Behavior-Framework/logs/habit-%N-%j.out
#SBATCH --error=/home/mila/m/manoosh.samiei/scratch/The-Bayesian-Behavior-Framework/logs/habit-%N-%j.err
#SBATCH --mail-user=manoosh.samiei@gmail.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load cuda/11.8/cudnn/8.9
module unload anaconda
cd /home/mila/m/manoosh.samiei/scratch/The-Bayesian-Behavior-Framework
export LD_LIBRARY_PATH=~/scratch/The-Bayesian-Behavior-Framework/lib:$LD_LIBRARY_PATH
source /home/mila/m/manoosh.samiei/scratch/The-Bayesian-Behavior-Framework/bayes3.8/bin/activate

CUDA_VISIBLE_DEVICES=0 python /home/mila/m/manoosh.samiei/scratch/The-Bayesian-Behavior-Framework/run_habitization_experiment.py --seed 12 --verbose 1 --gui 0 --savepath './data/' --details_savepath='./details/' --only_sac='False'



