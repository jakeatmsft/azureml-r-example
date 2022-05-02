# How to be productive with R in AzureML Compute Instance

## Switching R env
AzureML Compute instances currently use RServer Community Edition to host RStudio client, this means that the client can only use a single version of R.  In order to switch R version you can install the new version of R to your Compute Instance and then replace the default version with the newly installed version.  The script : [switch_r_env.sh](https://github.com/jakeatmsft/azureml-r-example/blob/d0948a93212fb4b17d404ee7c4d2035ae1a89d18/compute_instance_aml/switch_r_env.sh)

### Steps:

 - Copy script to Compute Instance
 - Script Usage:
  <code>  usage: switch_r_env.sh [R_Version]
  example: $./switch_r_env.sh 4.0.5
  See https://cran.r-project.org/src/base/R-4/ for available versions. </code>

 - Restart RStudio Session
   - Go to Session -> Quit Session to restart client with new R version.


## Using AzureML datasets in R

 - Login from Compute Instance with Azure AD
 - Open Terminal :
   - <code> az login --use-device-code </code>
 - Open demo notebook:
   - [DatasetToDataFrame](https://github.com/jakeatmsft/azureml-r-example/blob/d0948a93212fb4b17d404ee7c4d2035ae1a89d18/compute_instance_aml/DatasetToDataFrame.Rmd)
 - Replace azureml connection information
   - <code>ws <- azureml<span>&#36;</span>Workspace<span>&#36;</span>get(name="<mark>workspace name</mark>",
                            subscription_id="<mark>subscription_id</mark>",
                            resource_group="<mark>resource_group</mark>",
                            auth=cli_auth) </code>

 - Use AzureML SDK to access datasets:
   - ![screen](https://github.com/jakeatmsft/azureml-r-example/blob/d0948a93212fb4b17d404ee7c4d2035ae1a89d18/compute_instance_aml/screen.png)