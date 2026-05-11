# =========================
# LOAD LIBRARIES
# =========================

library(dplyr)
library(ggplot2)
library(pROC)
library(caret)
library(car)
library(ggcorrplot)
library(mltools)
library(data.table)
library(jtools)
library(reshape2)
library(PRROC)

# =========================
# LOAD DATA
# =========================

churn_data <- read.csv("Desktop/DAT690_Data/CustomerChurn_Data.csv")
verify_data <- read.csv("Desktop/DAT690_Data/CustomerChurn_Verify.csv")

# =========================
# CLEANING
# =========================

# Remove missing values
churn_data <- churn_data[complete.cases(churn_data[,1:83]),]

# Remove irrelevant columns
drop_cols <- c(26,30:45,48:70,73,74,76:79)
churn_data <- churn_data[, -drop_cols]
verify_data <- verify_data[, -drop_cols]

# Remove highly correlated variables
remove_vars <- c("MOUREC", "PEAKVCE", "OPEAKVCE",
                 "DROPVCE", "RETCALL", "PHONES")

churn_data <- churn_data[, !(names(churn_data) %in% remove_vars)]
verify_data <- verify_data[, !(names(verify_data) %in% remove_vars)]
