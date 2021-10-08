# set libraries
library(tidyverse)
library(conjoint)
library(rio)

# set attribute vectors and their levels generating
# all possible combinations between them

c <- expand.grid(
  price <- c("80", "120", "160", "200"),
  size <- c("6 pulgadas", "8 pulgadas", "10 pulgadas"),
  backlight <- c("sí", "no"),
  water_resistant <- c("sí", "no"),
  internal_mem <- c('4GB','8GB','16GB','32GB'))

# set attribute names

names(c) <- c("price", "size", 
              "backlight", "water_resistant", 
              "internal_memory")

# set seed in order to ensure reproducibility
set.seed(0)

# Elaborate fractional factorial design

design <- caFactorialDesign(data=c, type="fractional")
code <- caEncodedDesign(design)
#export design

write_csv(code, 'factorialDesign.csv')

#print alternatives to populate survey
for(i in 1:nrow(design)){
  print(paste('Precio (USD):', design$price[i],'-', 
              'Tamaño:', design$size[i],',',
              'Backlight:', design$backlight[i],',',
              'Sumergible:', design$water_resistant[i],',',
              'Mem. interna:', design$internal_memory[i]))
}

