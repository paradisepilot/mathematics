
command.arguments <- commandArgs(trailingOnly = TRUE);
   code.directory <- normalizePath(command.arguments[1]);
 output.directory <- normalizePath(command.arguments[2]);

cat(paste0("##### Sys.time(): ",Sys.time(),"\n"));
start.proc.time <- proc.time();

setwd(output.directory);

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
require(cowplot);
require(foreach);
require(ggplot2);
require(parallel);
require(R6);
require(RColorBrewer);
require(rpart);
require(rpart.plot);
require(stringr);
require(survey);

files.R <- c(
    );

for ( file.R in files.R ) {
    source(file.path(code.directory,file.R));
    }

###################################################
###################################################
is.macOS <- grepl(x = sessionInfo()[['platform']], pattern = 'apple', ignore.case = TRUE);

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
commutator <- function(X,Y) {
    return( X %*% Y - Y %*% X);
    }

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
R12 <- matrix(
    data = c(
         0, 0, 0, 0,
         0, 0,-1, 0,
         0, 1, 0, 0,
         0, 0, 0, 0),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nR12\n");
print( R12   );

R13 <- matrix(
    data = c(
         0, 0, 0, 0,
         0, 0, 0,-1,
         0, 0, 0, 0,
         0, 1, 0, 0),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nR13\n");
print( R13   );

R23 <- matrix(
    data = c(
         0, 0, 0, 0,
         0, 0, 0, 0,
         0, 0, 0,-1,
         0, 0, 1, 0),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nR23\n");
print( R23   );

B01 <- matrix(
    data = c(
        0,1,0,0,
        1,0,0,0,
        0,0,0,0,
        0,0,0,0),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nB01\n");
print( B01   );

B02 <- matrix(
    data = c(
        0,0,1,0,
        0,0,0,0,
        1,0,0,0,
        0,0,0,0),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nB02\n");
print( B02   );

B03 <- matrix(
    data = c(
        0,0,0,1,
        0,0,0,0,
        0,0,0,0,
        1,0,0,0),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nB03\n");
print( B03   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(R12,R13) - (R23)\n");
print( commutator(R12,R13) - (R23)   );

cat("\ncommutator(R12,R23) - (-R13)\n");
print( commutator(R12,R23) - (-R13)   );

cat("\ncommutator(R13,R23) - (R12)\n");
print( commutator(R13,R23) - (R12)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B01,B02) - (-R12)\n");
print( commutator(B01,B02) - (-R12)   );

cat("\ncommutator(B01,B03) - (-R13)\n");
print( commutator(B01,B03) - (-R13)   );

cat("\ncommutator(B02,B03) - (-R23)\n");
print( commutator(B02,B03) - (-R23)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B01,R12) - (-B02)\n");
print( commutator(B01,R12) - (-B02)   );

cat("\ncommutator(B01,R13) - (-B03)\n");
print( commutator(B01,R13) - (-B03)   );

cat("\ncommutator(B01,R23)\n");
print( commutator(B01,R23)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B02,R12) - (B01)\n");
print( commutator(B02,R12) - (B01)   );

cat("\ncommutator(B02,R13)\n");
print( commutator(B02,R13)   );

cat("\ncommutator(B02,R23) - (-B03)\n");
print( commutator(B02,R23) - (-B03)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B03,R12)\n");
print( commutator(B03,R12)   );

cat("\ncommutator(B03,R13) - (B01)\n");
print( commutator(B03,R13) - (B01)   );

cat("\ncommutator(B03,R23) - (B02)\n");
print( commutator(B03,R23) - (B02)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
X1 <- matrix(
    data = c(
         0,-1, 0,
         1, 0, 0,
         0, 0, 0),
    byrow = TRUE,
    nrow  = 3
    );
cat("\nX1\n");
print( X1   );

X2 <- matrix(
    data = c(
         0, 0,-1,
         0, 0, 0,
         1, 0, 0),
    byrow = TRUE,
    nrow  = 3
    );
cat("\nX2\n");
print( X2   );

X3 <- matrix(
    data = c(
         0, 0, 0,
         0, 0,-1,
         0, 1, 0),
    byrow = TRUE,
    nrow  = 3
    );
cat("\nX3\n");
print( X3   );

cat("\ncommutator(X1,X2) - (X3)\n");
print( commutator(X1,X2) - (X3)   );

cat("\ncommutator(X3,X1) - (X2)\n");
print( commutator(X3,X1) - (X2)   );

cat("\ncommutator(X2,X3) - (X1)\n");
print( commutator(X2,X3) - (X1)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###

###################################################
###################################################
# print warning messages to log
cat("\n##### warnings()\n")
print(warnings());

# print session info to log
cat("\n##### sessionInfo()\n")
print( sessionInfo() );

# print system time to log
cat(paste0("\n##### Sys.time(): ",Sys.time(),"\n"));

# print elapsed time to log
stop.proc.time <- proc.time();
cat("\n##### start.proc.time() - stop.proc.time()\n");
print( stop.proc.time - start.proc.time );

quit(save = "no");
