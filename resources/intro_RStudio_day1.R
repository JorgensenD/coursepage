# RECON: An introduction to R and RStudio
# DAY 1

# Coding basics ----
2 + 4 # adding 2 + 4
1/200 # dividing 1 by 200
3*4 # multiplying 3 and 4

x <- 3 * 4 # store the result of the operation (3*4) in a vector called 'x
x # look at x

y <- "hello world" # create a vector 'y' which contains the words "hello world"
y # look at y

# Structures in R ----
## Atomic vectors ----
vector_double <- c(1, 2, 3, 4) # creating a numeric (i.e. double) vector which contains numbers 1 to 4
typeof(vector_double) # check what type of structure 'vector_double' is
vector_double[3] # subset 3rd element of vector

vector_logic <- c(TRUE, FALSE, FALSE, TRUE) # creating a logical vector
typeof(vector_logic)
vector_logic[3]

vector_character <- c("A", "B", "C", "D") # creating a character vector (specified by " ")
typeof(vector_character)

vector_integer <- c(1L, 2L, 3L, 4L) # creating an integer vector (specified explicitly by L)
typeof(vector_integer)

# When creating a vector if you mix data structures, 
# R will automatically assume it is one structure only. Example:
other_vector <- c(1,2,3,"hello") # the character will override the numeric
other_vector2 <- c("1","2","3") # if you put " " around numbers, R will assume this is a character
other_vector3 <- c(TRUE, FALSE, 5) # numerics override logical

## Matrices ----
# creating a matrix (called 'matrix_of_doub') with 2 rows and 2 columns,
# made up of the data from vector_double:
matrix_of_doub <-  matrix(data = vector_double, nrow = 2, ncol = 2)
matrix_of_doub # look at the matrix

dim(matrix_of_doub) # dimensions of matrix, format: rows, columns
matrix_of_doub[1,2] # subset element in 1st row, 2nd column
matrix_of_doub[1,] # subset all elements in 1st row

# matrix of logical values
matrix_of_log <-  matrix(data = vector_logic, nrow = 4, ncol = 3)
matrix_of_log

# matrix of character values
vector_character <- c("A", "B", "C", "D")
matrix_of_char <- matrix(data = vector_character, nrow = 4, ncol = 4)
matrix_of_char

# matrix of integer values
matrix_of_int <-  matrix(data = vector_integer, nrow = 4, ncol = 5)
matrix_of_int

## Arrays ----
vector_example <-1:18 # create a numeric vector with numbers 1 to 18
array_example <- array(data = vector_example, dim = c(2, 3, 3)) # create array

dim(array_example) # get the dimensions of the array; structure: rows, columns, dimensions
array_example # look at the array

## Data frames ----
# create a dataframe with the 4 vectors we created before:
data_example <- data.frame(vector_character, vector_double, vector_logic, vector_integer)
str(data_example) # structure of the dataframe
data_example[1,2] # subset specific rows/columns; structure: [rows,column]
data_example$vector_integer # '$' allows to access a specific column
data_example$vector_integer[3] # accessing specific element in a column

vector1 <- data_example$vector_integer[c(2,4)] # create a vector which contains the 2nd and 4th value from the column 'vector_integer' from data_example dataframe 

## Lists ----
# create a list with a vector, a matrix and dataframe
list_example <- list(vector_character, # the vector
                     matrix_of_doub, # the matrix
                     data_example) # the dataframe

list_example[[2]] # subset the 2nd object in a list
list_example[[1]][1] # subset the first object in a list, and the first element of that object
list_example[[1]][1:3] # subset the first object in a list, and the 1st to 3rd elements of that object

# Functions ----
## Example 1 ----
# The name (myfun)
myfun <- function(weight, 
                  height) # The arguments (weight and height)
{ 
  # The body
  
  BMI      <- weight/(height^2)
  
  return(BMI) # Retun specification for the output
}

formals(myfun) # Get or set the formal arguments of a function
body(myfun) # Get or set the body of a function
environment(myfun) # Get or set the environment

myfun(weight = 88, height = 1.78)
myfun(88, 1.78) # does the same thing as above

## Example 2 ----
# The name (myfun2)
myfun2 <- function(weight, 
                   height,
                   units = 'kg/m2') # The arguments (weight and height)
{ 
  # The body
  BMI      <- weight/(height^2)
  output <- paste(round(BMI, 1), units)
  
  return(output) # Retun specification for the output
}


myfun2(weight = 88, height = 1.78) # the units are automatically coded as 'kg/m2' (see function arguments)
myfun2(weight = 8800, height = 178, units = 'g/cm2') # explicitly changing the units

# R packages ----
install.packages('incidence') # to download a package on R (you only need to do this once)
library(incidence) # to load the package on R (so you can use it - you need to do it at each session)

# Misc ----
rm(x) # to remove specific objects
rm(list=ls()) # to remove everything