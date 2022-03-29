library(optparse)
library("carrier")

# Loading azureml_utils.R. This is needed to use AML as MLflow backend tracking store.
source('azureml_utils.R')

# Setting MLflow related env vars
# https://www.mlflow.org/docs/latest/R-api.html#details
Sys.setenv(MLFLOW_BIN=system("which mlflow", intern=TRUE))
Sys.setenv(MLFLOW_PYTHON_BIN=system("which python", intern=TRUE))

options <- list(
  make_option(c("-m", "--model_folder"), default="./model")
)

opt_parser <- OptionParser(option_list = options)
opt <- parse_args(opt_parser)

paste(opt$model_folder)

with(run <- mlflow_start_run(), {
  print("Loading the model")
  load(file.path(opt$model_folder, "model.rdata"))
  print(summary(model))
  print("Loading the predictions")
  print(file.path(opt$model_folder, "predictions.Rd"))
  print(file.info(file.path(opt$model_folder, "predictions.Rd")))
  predictions <- readRDS(file.path(opt$model_folder, "predictions.Rd"))
  print(head(predictions))

})