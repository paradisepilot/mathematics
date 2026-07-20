
do.so3 <- function(
    ) {

    thisFunctionName <- "do.so3";

    base::cat("\n### ~~~~~~~~~~~~~~~~~~~~ ###");
    base::cat(base::paste0("\n",thisFunctionName,"() starts.\n\n"));

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
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

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
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

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
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

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    base::cat(base::paste0("\n# ",thisFunctionName,"() quits."));
    base::cat("\n### ~~~~~~~~~~~~~~~~~~~~ ###\n");
    base::return( NULL );

    }
