#!/bin/bash
#
# CREATED USING THE BIOHPC PORTAL on Fri Nov 30 2020 10:14:18 GMT-0600 (Central Standard Time)
#
# This file is batch script used to run commands on the BioHPC cluster.
# The script is submitted to the cluster using the SLURM `sbatch` command.
# Lines starting with # are comments, and will not be run.
# Lines starting with #SBATCH specify options for the scheduler.
# Lines that do not start with # or #SBATCH are commands that will run.

#!/bin/bash

#SBATCH --job-name=Antibody
#SBATCH --partition=GPUv100s
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --time=0-20:00:00
#SBATCH --output=namd2.%j.out
#
#

export CUDA_VISIBLE_DEVICES=0	# 0 for 1st GPU, 1 for 2nd GPU, 0,1 for both
# Modify the following lines:
export NAMD_DIR="/home2/your_id/tools/namd2/namd2.13_gpu"
export LD_LIBRARY_PATH=$NAMD_DIR:$LD_LIBRARY_PATH

numCPU=$SLURM_JOB_CPUS_PER_NODE

NAMD="$NAMD_DIR/namd2 +p$numCPU +idlepoll "

$NAMD equilibration.conf > equil.log
$NAMD md.conf >md.log

# END OF SCRIPT
