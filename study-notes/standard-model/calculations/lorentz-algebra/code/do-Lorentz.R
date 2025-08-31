
do.Lorentz <- function(
    ) {

    thisFunctionName <- "do.Lorentz";

    base::cat("\n### ~~~~~~~~~~~~~~~~~~~~ ###");
    base::cat(base::paste0("\n",thisFunctionName,"() starts.\n\n"));

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    R23 <- matrix(
        data = c(
             0, 0, 0, 0,
             0, 0, 0, 0,
             0, 0, 0,-1,
             0, 0, 1, 0),
        byrow = TRUE,
        nrow  = 4
        );

    R31 <- matrix(
        data = c(
             0, 0, 0, 0,
             0, 0, 0, 1,
             0, 0, 0, 0,
             0,-1, 0, 0),
        byrow = TRUE,
        nrow  = 4
        );

    R12 <- matrix(
        data = c(
             0, 0, 0, 0,
             0, 0,-1, 0,
             0, 1, 0, 0,
             0, 0, 0, 0),
        byrow = TRUE,
        nrow  = 4
        );

    B01 <- matrix(
        data = c(
            0,1,0,0,
            1,0,0,0,
            0,0,0,0,
            0,0,0,0),
        byrow = TRUE,
        nrow  = 4
        );

    B02 <- matrix(
        data = c(
            0,0,1,0,
            0,0,0,0,
            1,0,0,0,
            0,0,0,0),
        byrow = TRUE,
        nrow  = 4
        );

    B03 <- matrix(
        data = c(
            0,0,0,1,
            0,0,0,0,
            0,0,0,0,
            1,0,0,0),
        byrow = TRUE,
        nrow  = 4
        );

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    # J1 <- sqrt(as.complex(-1)) * matrix(
    #     data = c(
    #         0, 0, 0, 0,
    #         0, 0, 0, 0,
    #         0, 0, 0,-1,
    #         0, 0, 1, 0
    #         ),
    #     byrow = TRUE,
    #     nrow  = 4
    #     );

    # J2 <- sqrt(as.complex(-1)) * matrix(
    #     data = c(
    #         0, 0, 0, 0,
    #         0, 0, 0, 1,
    #         0, 0, 0, 0,
    #         0,-1, 0, 0
    #         ),
    #     byrow = TRUE,
    #     nrow  = 4
    #     );

    # J3 <- sqrt(as.complex(-1)) * matrix(
    #     data = c(
    #         0, 0, 0, 0,
    #         0, 0,-1, 0,
    #         0, 1, 0, 0,
    #         0, 0, 0, 0
    #         ),
    #     byrow = TRUE,
    #     nrow  = 4
    #     );

    # K1 <- sqrt(as.complex(-1)) * matrix(
    #     data = c(
    #         0, 1, 0, 0,
    #         1, 0, 0, 0,
    #         0, 0, 0, 0,
    #         0, 0, 0, 0
    #         ),
    #     byrow = TRUE,
    #     nrow  = 4
    #     );

    # K2 <- sqrt(as.complex(-1)) * matrix(
    #     data = c(
    #         0, 0, 1, 0,
    #         0, 0, 0, 0,
    #         1, 0, 0, 0,
    #         0, 0, 0, 0
    #         ),
    #     byrow = TRUE,
    #     nrow  = 4
    #     );

    # K3 <- sqrt(as.complex(-1)) * matrix(
    #     data = c(
    #         0, 0, 0, 1,
    #         0, 0, 0, 0,
    #         0, 0, 0, 0,
    #         1, 0, 0, 0
    #         ),
    #     byrow = TRUE,
    #     nrow  = 4
    #     );

    J1 <- sqrt(as.complex(-1)) * R23;
    J2 <- sqrt(as.complex(-1)) * R31;
    J3 <- sqrt(as.complex(-1)) * R12;

    K1 <- sqrt(as.complex(-1)) * B01;
    K2 <- sqrt(as.complex(-1)) * B02;
    K3 <- sqrt(as.complex(-1)) * B03;

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    cat("\nR23\n");
    print( R23   );
    cat("\nR31\n");
    print( R31   );
    cat("\nR12\n");
    print( R12   );

    cat("\ncommutator(R23,R31) - (R12)\n");
    print( commutator(R23,R31) - (R12)   );
    cat("\ncommutator(R12,R23) - (R31)\n");
    print( commutator(R12,R23) - (R31)   );
    cat("\ncommutator(R31,R12) - (R23)\n");
    print( commutator(R31,R12) - (R23)   );

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    cat("\nB01\n");
    print( B01   );
    cat("\nB02\n");
    print( B02   );
    cat("\nB03\n");
    print( B03   );

    cat("\ncommutator(B01,B02) - (-R12)\n");
    print( commutator(B01,B02) - (-R12)   );
    cat("\ncommutator(B02,B03) - (-R23)\n");
    print( commutator(B02,B03) - (-R23)   );
    cat("\ncommutator(B03,B01) - (-R31)\n");
    print( commutator(B03,B01) - (-R31)   );

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    cat("\ncommutator(R23,B01)\n");
    print( commutator(R23,B01)   );
    cat("\ncommutator(R23,B02) - ( B03)\n");
    print( commutator(R23,B02) - ( B03)   );
    cat("\ncommutator(R23,B03) - (-B02)\n");
    print( commutator(R23,B03) - (-B02)   );

    cat("\ncommutator(R31,B01) - (-B03)\n");
    print( commutator(R31,B01) - (-B03)   );
    cat("\ncommutator(R31,B02)\n");
    print( commutator(R31,B02)   );
    cat("\ncommutator(R31,B03) - ( B01)\n");
    print( commutator(R31,B03) - ( B01)   );

    cat("\ncommutator(R12,B01) - ( B02)\n");
    print( commutator(R12,B01) - ( B02)   );
    cat("\ncommutator(R12,B02) - (-B01)\n");
    print( commutator(R12,B02) - (-B01)   );
    cat("\ncommutator(R12,B03)\n");
    print( commutator(R12,B03)   );

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
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
    cat("\nK1\n");
    print( K1   );
    cat("\nK2\n");
    print( K2   );
    cat("\nK3\n");
    print( K3   );

    cat("\ncommutator(K1,K2) - (- sqrt(as.complex(-1)) * J3)\n");
    print( commutator(K1,K2) - (- sqrt(as.complex(-1)) * J3)   );
    cat("\ncommutator(K3,K1) - (- sqrt(as.complex(-1)) * J2)\n");
    print( commutator(K3,K1) - (- sqrt(as.complex(-1)) * J2)   );
    cat("\ncommutator(K2,K3) - (- sqrt(as.complex(-1)) * J1)\n");
    print( commutator(K2,K3) - (- sqrt(as.complex(-1)) * J1)   );

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    cat("\ncommutator(J1,K1)\n");
    print( commutator(J1,K1)   );
    cat("\ncommutator(J1,K2) - (  sqrt(as.complex(-1)) * K3)\n");
    print( commutator(J1,K2) - (  sqrt(as.complex(-1)) * K3)   );
    cat("\ncommutator(J1,K3) - (- sqrt(as.complex(-1)) * K2)\n");
    print( commutator(J1,K3) - (- sqrt(as.complex(-1)) * K2)   );

    cat("\ncommutator(J2,K1) - (- sqrt(as.complex(-1)) * K3)\n");
    print( commutator(J2,K1) - (- sqrt(as.complex(-1)) * K3)   );
    cat("\ncommutator(J2,K2)\n");
    print( commutator(J2,K2)   );
    cat("\ncommutator(J2,K3) - (  sqrt(as.complex(-1)) * K1)\n");
    print( commutator(J2,K3) - (  sqrt(as.complex(-1)) * K1)   );

    cat("\ncommutator(J3,K1) - (  sqrt(as.complex(-1)) * K2)\n");
    print( commutator(J3,K1) - (  sqrt(as.complex(-1)) * K2)   );
    cat("\ncommutator(J3,K2) - (- sqrt(as.complex(-1)) * K1)\n");
    print( commutator(J3,K2) - (- sqrt(as.complex(-1)) * K1)   );
    cat("\ncommutator(J3,K3)\n");
    print( commutator(J3,K3)   );

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    Np1 <- (J1 + sqrt(as.complex(-1)) * K1) / 2;
    Np2 <- (J2 + sqrt(as.complex(-1)) * K2) / 2;
    Np3 <- (J3 + sqrt(as.complex(-1)) * K3) / 2;

    Nm1 <- (J1 - sqrt(as.complex(-1)) * K1) / 2;
    Nm2 <- (J2 - sqrt(as.complex(-1)) * K2) / 2;
    Nm3 <- (J3 - sqrt(as.complex(-1)) * K3) / 2;

    cat("\nNp1\n");
    print( Np1   );
    cat("\nNp2\n");
    print( Np2   );
    cat("\nNp3\n");
    print( Np3   );

    cat("\ncommutator(Np1,Np2) - (sqrt(as.complex(-1)) * Np3)\n");
    print( commutator(Np1,Np2) - (sqrt(as.complex(-1)) * Np3)   );
    cat("\ncommutator(Np3,Np1) - (sqrt(as.complex(-1)) * Np2)\n");
    print( commutator(Np3,Np1) - (sqrt(as.complex(-1)) * Np2)   );
    cat("\ncommutator(Np2,Np3) - (sqrt(as.complex(-1)) * Np1)\n");
    print( commutator(Np2,Np3) - (sqrt(as.complex(-1)) * Np1)   );

    cat("\nNm1\n");
    print( Nm1   );
    cat("\nNm2\n");
    print( Nm2   );
    cat("\nNm3\n");
    print( Nm3   );

    cat("\ncommutator(Nm1,Nm2) - (sqrt(as.complex(-1)) * Nm3)\n");
    print( commutator(Nm1,Nm2) - (sqrt(as.complex(-1)) * Nm3)   );
    cat("\ncommutator(Nm3,Nm1) - (sqrt(as.complex(-1)) * Nm2)\n");
    print( commutator(Nm3,Nm1) - (sqrt(as.complex(-1)) * Nm2)   );
    cat("\ncommutator(Nm2,Nm3) - (sqrt(as.complex(-1)) * Nm1)\n");
    print( commutator(Nm2,Nm3) - (sqrt(as.complex(-1)) * Nm1)   );

    cat("\ncommutator(Np1,Nm2)\n");
    print( commutator(Np1,Nm2)   );
    cat("\ncommutator(Np3,Nm1)\n");
    print( commutator(Np3,Nm1)   );
    cat("\ncommutator(Np2,Nm3)\n");
    print( commutator(Np2,Nm3)   );

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    base::cat(base::paste0("\n# ",thisFunctionName,"() quits."));
    base::cat("\n### ~~~~~~~~~~~~~~~~~~~~ ###\n");
    base::return( NULL );

    }
