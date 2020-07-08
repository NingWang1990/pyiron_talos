#!/bin/bash -l
{%- if cores < 40 %}
#SBATCH --partition=s.talos
{%- else %}
#SBATCH --partition=p.talos
{%- endif %}
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

#SBATCH --output=time.out
#SBATCH --error=error.out
#SBATCH --job-name={{job_name}}
#SBATCH -D {{working_directory}}
#SBATCH --get-user-env=L

{{command}}
