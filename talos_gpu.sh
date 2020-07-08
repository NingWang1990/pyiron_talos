#!/bin/bash -l
#SBATCH --partition=p.talos
#SBATCH --ntasks={{cores}}

{%- if run_time_max %}
#SBATCH --time={{run_time_max}}
{%- endif %}
{%- if memory_max %}
#SBATCH --mem={{memory_max}}
{%- else %}
{%- if cores < 40 %}
#SBATCH --mem-per-cpu=4GB
{%- endif %}
{%- endif %}

{%- if run_time_max %}
#SBATCH --time={{run_time_max}}
{%- endif %}

# for GPU
#SBATCH --gres=gpu:2

#SBATCH --output=time.out
#SBATCH --error=error.out
#SBATCH --job-name={{job_name}}
#SBATCH -D {{working_directory}}
#SBATCH --get-user-env=L

{{command}}
