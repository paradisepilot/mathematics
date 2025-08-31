
do.su2 <- function(
    ) {

    thisFunctionName <- "do.su2";

    base::cat("\n### ~~~~~~~~~~~~~~~~~~~~ ###");
    base::cat(base::paste0("\n",thisFunctionName,"() starts.\n\n"));

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
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

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
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

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
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


    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    base::cat(base::paste0("\n# ",thisFunctionName,"() quits."));
    base::cat("\n### ~~~~~~~~~~~~~~~~~~~~ ###\n");
    base::return( NULL );

    }
