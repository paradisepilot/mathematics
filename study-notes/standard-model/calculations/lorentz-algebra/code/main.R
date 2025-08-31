
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

R31 <- matrix(
    data = c(
         0, 0, 0, 0,
         0, 0, 0, 1,
         0, 0, 0, 0,
         0,-1, 0, 0),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nR31\n");
print( R31   );

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
cat("\ncommutator(R23,R31) - (R12)\n");
print( commutator(R23,R31) - (R12)   );

cat("\ncommutator(R12,R23) - (R31)\n");
print( commutator(R12,R23) - (R31)   );

cat("\ncommutator(R31,R12) - (R23)\n");
print( commutator(R31,R12) - (R23)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B01,B02) - (-R12)\n");
print( commutator(B01,B02) - (-R12)   );

cat("\ncommutator(B02,B03) - (-R23)\n");
print( commutator(B02,B03) - (-R23)   );

cat("\ncommutator(B03,B01) - (-R31)\n");
print( commutator(B03,B01) - (-R31)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B01,R12) - (-B02)\n");
print( commutator(B01,R12) - (-B02)   );

cat("\ncommutator(B01,R31) - ( B03)\n");
print( commutator(B01,R31) - ( B03)   );

cat("\ncommutator(B01,R23)\n");
print( commutator(B01,R23)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B02,R12) - (B01)\n");
print( commutator(B02,R12) - (B01)   );

cat("\ncommutator(B02,R31)\n");
print( commutator(B02,R31)   );

cat("\ncommutator(B02,R23) - (-B03)\n");
print( commutator(B02,R23) - (-B03)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
cat("\ncommutator(B03,R12)\n");
print( commutator(B03,R12)   );

cat("\ncommutator(B03,R31) - (-B01)\n");
print( commutator(B03,R31) - (-B01)   );

cat("\ncommutator(B03,R23) - (B02)\n");
print( commutator(B03,R23) - (B02)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
X1 <- matrix(
    data = c(
         0, 0, 0,
         0, 0,-1,
         0, 1, 0),
    byrow = TRUE,
    nrow  = 3
    );
cat("\nX1\n");
print( X1   );

X2 <- - matrix(
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
         0,-1, 0,
         1, 0, 0,
         0, 0, 0),
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
J1 <- sqrt(as.complex(-1)) * X1;
J2 <- sqrt(as.complex(-1)) * X2;
J3 <- sqrt(as.complex(-1)) * X3;

cat("\nJ1\n");
print( J1   );

cat("\nJ2\n");
print( J2   );

cat("\nJ3\n");
print( J3   );

cat("\ncommutator(J1,J2) - (sqrt(as.complex(-1)) * J3)\n");
print( commutator(J1,J2) - (sqrt(as.complex(-1)) * J3)   );

cat("\ncommutator(J3,J1) - (sqrt(as.complex(-1)) * J2)\n");
print( commutator(J3,J1) - (sqrt(as.complex(-1)) * J2)   );

cat("\ncommutator(J2,J3) - (sqrt(as.complex(-1)) * J1)\n");
print( commutator(J2,J3) - (sqrt(as.complex(-1)) * J1)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
Jplus  <- J1 + sqrt(as.complex(-1)) * J2;
Jminus <- J1 - sqrt(as.complex(-1)) * J2;

cat("\nJplus\n");
print( Jplus   );

cat("\nJminus\n");
print( Jminus   );

cat("\ncommutator(J3,Jplus) - (Jplus)\n");
print( commutator(J3,Jplus) - (Jplus)   );

cat("\ncommutator(J3,Jminus) - (- Jminus)\n");
print( commutator(J3,Jminus) - (- Jminus)   );

cat("\ncommutator(Jplus,Jminus) - (2 * J3)\n");
print( commutator(Jplus,Jminus) - (2 * J3)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
sigma1 <- matrix(
    data = c(
         0, 1,
         1, 0
         ),
    byrow = TRUE,
    nrow  = 2
    );
cat("\nsigma1\n");
print( sigma1   );

sigma2 <- sqrt(as.complex(-1)) * matrix(
    data = c(
         0, -1,
         1,  0
         ),
    byrow = TRUE,
    nrow  = 2
    );
cat("\nsigma2\n");
print( sigma2   );

sigma3 <- matrix(
    data = c(
         1,  0,
         0, -1
         ),
    byrow = TRUE,
    nrow  = 2
    );
cat("\nsigma3\n");
print( sigma3   );

Y1 <-   sqrt(as.complex(-1)) * sigma1 / 2;
Y2 <- - sqrt(as.complex(-1)) * sigma2 / 2;
Y3 <-   sqrt(as.complex(-1)) * sigma3 / 2;

cat("\nY1\n");
print( Y1   );

cat("\nY2\n");
print( Y2   );

cat("\nY3\n");
print( Y3   );

cat("\ncommutator(Y1,Y2) - (Y3)\n");
print( commutator(Y1,Y2) - (Y3)   );

cat("\ncommutator(Y3,Y1) - (Y2)\n");
print( commutator(Y3,Y1) - (Y2)   );

cat("\ncommutator(Y2,Y3) - (Y1)\n");
print( commutator(Y2,Y3) - (Y1)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
S1 <- sqrt(as.complex(-1)) * Y1;
S2 <- sqrt(as.complex(-1)) * Y2;
S3 <- sqrt(as.complex(-1)) * Y3;

cat("\nS1\n");
print( S1   );

cat("\nS2\n");
print( S2   );

cat("\nS3\n");
print( S3   );

cat("\ncommutator(S1,S2) - (sqrt(as.complex(-1)) * S3)\n");
print( commutator(S1,S2) - (sqrt(as.complex(-1)) * S3)   );

cat("\ncommutator(S3,S1) - (sqrt(as.complex(-1)) * S2)\n");
print( commutator(S3,S1) - (sqrt(as.complex(-1)) * S2)   );

cat("\ncommutator(S2,S3) - (sqrt(as.complex(-1)) * S1)\n");
print( commutator(S2,S3) - (sqrt(as.complex(-1)) * S1)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
Splus  <- S1 + sqrt(as.complex(-1)) * S2;
Sminus <- S1 - sqrt(as.complex(-1)) * S2;

cat("\nSplus\n");
print( Splus   );

cat("\nSminus\n");
print( Sminus   );

cat("\ncommutator(S3,Splus) - (Splus)\n");
print( commutator(S3,Splus) - (Splus)   );

cat("\ncommutator(S3,Sminus) - (- Sminus)\n");
print( commutator(S3,Sminus) - (- Sminus)   );

cat("\ncommutator(Splus,Sminus) - (2 * S3)\n");
print( commutator(Splus,Sminus) - (2 * S3)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
J1 <- sqrt(as.complex(-1)) * matrix(
    data = c(
        0, 0, 0, 0,
        0, 0, 0, 0,
        0, 0, 0,-1,
        0, 0, 1, 0
        ),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nJ1\n");
print( J1   );

J2 <- sqrt(as.complex(-1)) * matrix(
    data = c(
        0, 0, 0, 0,
        0, 0, 0, 1,
        0, 0, 0, 0,
        0,-1, 0, 0
        ),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nJ2\n");
print( J2   );

J3 <- sqrt(as.complex(-1)) * matrix(
    data = c(
        0, 0, 0, 0,
        0, 0,-1, 0,
        0, 1, 0, 0,
        0, 0, 0, 0
        ),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nJ3\n");
print( J3   );

cat("\ncommutator(J1,J2) - (sqrt(as.complex(-1)) * J3)\n");
print( commutator(J1,J2) - (sqrt(as.complex(-1)) * J3)   );

cat("\ncommutator(J3,J1) - (sqrt(as.complex(-1)) * J2)\n");
print( commutator(J3,J1) - (sqrt(as.complex(-1)) * J2)   );

cat("\ncommutator(J2,J3) - (sqrt(as.complex(-1)) * J1)\n");
print( commutator(J2,J3) - (sqrt(as.complex(-1)) * J1)   );

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
K1 <- sqrt(as.complex(-1)) * matrix(
    data = c(
        0, 1, 0, 0,
        1, 0, 0, 0,
        0, 0, 0, 0,
        0, 0, 0, 0
        ),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nK1\n");
print( K1   );

K2 <- sqrt(as.complex(-1)) * matrix(
    data = c(
        0, 0, 1, 0,
        0, 0, 0, 0,
        1, 0, 0, 0,
        0, 0, 0, 0
        ),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nK2\n");
print( K2   );

K3 <- sqrt(as.complex(-1)) * matrix(
    data = c(
        0, 0, 0, 1,
        0, 0, 0, 0,
        0, 0, 0, 0,
        1, 0, 0, 0
        ),
    byrow = TRUE,
    nrow  = 4
    );
cat("\nK3\n");
print( K3   );

cat("\ncommutator(K1,K2)\n");
print( commutator(K1,K2)   );

cat("\ncommutator(K1,K2) - (- sqrt(as.complex(-1)) * J3)\n");
print( commutator(K1,K2) - (- sqrt(as.complex(-1)) * J3)   );

cat("\ncommutator(K3,K1) - (- sqrt(as.complex(-1)) * J2)\n");
print( commutator(K3,K1) - (- sqrt(as.complex(-1)) * J2)   );

cat("\ncommutator(K2,K3) - (- sqrt(as.complex(-1)) * J1)\n");
print( commutator(K2,K3) - (- sqrt(as.complex(-1)) * J1)   );

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
