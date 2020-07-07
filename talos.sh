#!/bin/bash -l
# Queue (Partition):
#SBATCH --partition=s.talos
# Number of nodes and MPI tasks per node:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40

{%- if run_time_max %}
#SBATCH --time={{run_time_max}}
{%- endif %}

#SBATCH --output=time.out
#SBATCH --error=error.out
#SBATCH --job-name={{job_name}}
#SBATCH -D {{working_directory}}
#SBATCH --get-user-env=L

{{command}}
