# azureml-r-example
Example for using azureml cli v2 with R models

# Instructions
- Open env_build.ipynb notebook and run all cells to create environment and compute cluster 
- install cliv2 :https://docs.microsoft.com/en-us/azure/machine-learning/how-to-configure-cli

- double check pipeline.yml

```
$schema: https://azuremlschemas.azureedge.net/latest/pipelineJob.schema.json
type: pipeline
compute:  azureml:[compute instance]
display_name: r-accidents-example
experiment_name: r-accidents-example
description: Train a GLM using R on the accidents dataset.  
jobs:
  train:
    command:   Rscript accidents.R
                --data ${{inputs.training_data}}
                --out ${{outputs.model_out}}
    code:
      local_path: src
    environment:
      azureml:[environment]:[env_version]
    inputs:
      training_data:
        dataset: 
          local_path: data
        mode: ro_mount
    outputs:
      model_out:
        mode: upload
  eval:
    command:   Rscript eval_model.r
                --model ${{inputs.model}}
    code:
      local_path: src
    environment:
      azureml:[environment]:[env_version]
    inputs:
      model: ${{jobs.train.outputs.model_out}}

```
update [compute instance] , eg. <b>cpu-cluster</b>
update [environment]:[env_version], <b>eg. r_env:1</b>

- login to azure (using managed identity):
  <code>az login --identity</code>

- run from accidents folder: 
  
  <code>az ml job create -f ./pipeline.yml --web</code>
