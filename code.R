library(tidyr)
library(dplyr)
library(stringr)

df <- titanic_original
df %>%
  filter(embarked == "")

#Fill in empty values in embarked to S
df$embarked <- ifelse(df$embarked == "", "S", df$embarked)

#Fill empty Age values with Mean of ages
df %>%
  filter(is.na(age))
summary(df$age)
mean_age <- 29.88
df$age <- ifelse(is.na(df$age), mean_age, df$age)

#Fill in life boat empty values with N/A
df$boat <- ifelse(df$boat == "", NA, df$boat)

#Create new column that if passenger has cabin number to 1, no cabin number to 0
has_cabin_number = ifelse(df$cabin == "", 0, 1)
df <- mutate(df, has_cabin_number = has_cabin_number)