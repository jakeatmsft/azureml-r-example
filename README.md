# azureml-r-example
Example for using azureml cli v2 with R models

# Instructions
- Open env_build.ipynb notebook and run all cells to create environment and compute cluster 
- install cliv2 :https://docs.microsoft.com/en-us/azure/machine-learning/how-to-configure-cli

- double check pipeline.yml parameters

- update [compute instance] , eg. <b>cpu-cluster</b>

- update [environment]:[env_version], <b>eg. r_env:1</b>

- login to azure (using managed identity):

  <code>az login --identity</code>

- run from accidents folder: 
  
  <code>az ml job create -f ./pipeline.yml --web</code>
