
   SOIENT
       P1 , P2 DES PILES ;
       L , L1 UN ARB DE ( ENTIER , BOOLEEN ) ;
       Travers_1 , Travers_3 , Create_trees , Inorder , Liberer_arbre , Take_leafs_2 , Travers_2 , Travers_4 ,
       Take_stk_1 , Take_stk_3 , Viderpile , Initialize_tree , Take_leafs_4 : ACTION ;
       Verify_1 , Verify_4 , Verify_2 , Delete_leafs_2 , Delete_leafs_4 , Verifie_arb , Verify_3 : FONCTION ( BOOLEEN
       ) ;
       H , C : ENTIER ;
       Continue : BOOLEEN ;
   DEBUT
       CREERPILE ( P1 ) ;
       CREERPILE ( P2 ) ;
       POUR C := 1 , 10
           APPEL Create_trees ( L , L1 ) ;
           SI Verifie_arb ( L ) :
               ECRIRE ( 'for tree:' , C ) ;
               APPEL Travers_1 ( L , P1 ) ;
               ECRIRE ( 'pour travers 1:' , Verify_1 ( P1 , L ) ) ;
               APPEL Viderpile ( P1 ) ;
               APPEL Initialize_tree ( L ) ;
               APPEL Travers_2 ( L , P1 ) ;
               ECRIRE ( 'pour travers 2:' , Verify_2 ( L , P1 ) ) ;
               APPEL Viderpile ( P1 ) ;
               APPEL Travers_3 ( L1 , P1 ) ;
               ECRIRE ( 'pour travers 3:' , Verify_3 ( P1 , L1 ) ) ;
               APPEL Viderpile ( P1 ) ;
               APPEL Initialize_tree ( L1 ) ;
               APPEL Travers_4 ( L1 , P1 ) ;
               ECRIRE ( 'pour travers 4:' , Verify_4 ( L1 , P1 ) ) ;
           SINON
               C := C - 1 ;
           FSI ;
           APPEL Viderpile ( P1 ) ;
       FPOUR ;
   FIN
  /* procedure travers 3--------------------------------------------------------------------*/
   ACTION Take_stk_3 ( T , P , Ph )
   SOIENT
       T UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , Ph DES PILES ;
       S UN ( ENTIER , BOOLEEN ) ;
       Mem UN ENTIER ;
   DEBUT
       SI T <> NIL :
           S := INFO ( T ) ;
           INIT_STRUCT ( S , [ STRUCT ( S , 1 ) , VRAI ] ) ;
           AFF_INFO ( T , S ) ;
           EMPILER ( P , STRUCT ( S , 1 ) ) ;
           SI FD ( T ) = NIL :
               SI FG ( T ) = NIL :
                   TQ PILEVIDE ( P ) = FAUX :
                       DEPILER ( P , Mem ) ;
                       EMPILER ( Ph , Mem ) ;
                   FTQ
               FINSI
           FINSI ;
           APPEL Take_stk_3 ( FD ( T ) , P , Ph ) ;
           APPEL Take_stk_3 ( FG ( T ) , P , Ph ) ;
       FINSI
   FIN
  /*-----------------------------------------------------------------------------------------------*/
   ACTION Travers_3 ( T , P )
   SOIENT
       T UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , Ph DES PILES ;
       M UN ENTIER ;
   DEBUT
       CREERPILE ( Ph ) ;
       APPEL Take_stk_3 ( T , P , Ph ) ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , M ) ;
           EMPILER ( P , M ) ;
       FTQ
   FIN
  /* procedure travers 1---------------------------------------------------------------------------------*/
   ACTION Take_stk_1 ( T , P , Ph )
   SOIENT
       T UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , Ph DES PILES ;
       S UN ( ENTIER , BOOLEEN ) ;
       Mem UN ENTIER ;
   DEBUT
       SI T <> NIL :
           S := INFO ( T ) ;
           INIT_STRUCT ( S , [ STRUCT ( S , 1 ) , VRAI ] ) ;
           AFF_INFO ( T , S ) ;
           EMPILER ( P , STRUCT ( S , 1 ) ) ;
           SI FD ( T ) = NIL :
               SI FG ( T ) = NIL :
                   TQ PILEVIDE ( P ) = FAUX :
                       DEPILER ( P , Mem ) ;
                       EMPILER ( Ph , Mem ) ;
                   FTQ ;
               FINSI
           FINSI ;
           APPEL Take_stk_1 ( FG ( T ) , P , Ph ) ;
           APPEL Take_stk_1 ( FD ( T ) , P , Ph ) ;
       FINSI
   FIN
  /*----------------------------------------------------------------------------------*/
   ACTION Travers_1 ( T , P )
   SOIENT
       T UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , Ph DES PILES ;
       M UN ENTIER ;
   DEBUT
       CREERPILE ( Ph ) ;
       APPEL Take_stk_1 ( T , P , Ph ) ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , M ) ;
           EMPILER ( P , M ) ;
       FTQ
   FIN
  /*---------------------------------------------------------------------------------------------*/
   ACTION Create_trees ( T , T1 )
   SOIENT
       T , T1 , N , N1 , K , K1 DES ARB DE ( ENTIER , BOOLEEN ) ;
       Bcl2 , M1 , M2 , Bcl1 : ENTIER ;
       R : ( ENTIER , BOOLEEN ) ;
   DEBUT
       CREERNOEUD ( T ) ;
       INIT_STRUCT ( R , [ ALEANOMBRE ( 50 ) + 39 , FAUX ] ) ;
       AFF_INFO ( T , R ) ;
       CREERNOEUD ( T1 ) ;
       AFF_INFO ( T1 , R ) ;
       POUR Bcl2 := 1 , 99
           CREERNOEUD ( K ) ;
           INIT_STRUCT ( R , [ ALEANOMBRE ( 100 ) , FAUX ] ) ;
           AFF_INFO ( K , R ) ;
           CREERNOEUD ( K1 ) ;
           AFF_INFO ( K1 , R ) ;
           M2 := STRUCT ( INFO ( K ) , 1 ) ;
           N := T ;
           N1 := T1 ;
           Continue := FAUX ;
           TQ Continue = FAUX :
               R := INFO ( N ) ;
               M1 := STRUCT ( R , 1 ) ;
               SI M1 > M2 :
                   SI FG ( N ) = NIL :
                       AFF_FG ( N , K ) ;
                       AFF_FG ( N1 , K1 ) ;
                       AFF_PERE ( K1 , N1 ) ;
                       AFF_PERE ( K , N ) ;
                       Continue := VRAI ;
                   SINON
                       N := FG ( N ) ;
                       N1 := FG ( N1 ) ;
                   FSI ;
               FSI ;
               SI M1 < M2 :
                   SI FD ( N ) = NIL :
                       AFF_FD ( N , K ) ;
                       AFF_FD ( N1 , K1 ) ;
                       AFF_PERE ( K1 , N1 ) ;
                       AFF_PERE ( K , N ) ;
                       Continue := VRAI ;
                   SINON
                       N := FD ( N ) ;
                       N1 := FD ( N1 ) ;
                   FSI ;
               FSI ;
               SI M1 = M2 :
                   LIBERERNOEUD ( K ) ;
                   LIBERERNOEUD ( K1 ) ;
                   Continue := VRAI ;
                   Bcl2 := Bcl2 - 1 ;
               FSI ;
           FTQ ;
       FPOUR ;
   FIN
  /*--------------------------------------------------------------------------*/
   FONCTION Verify_1 ( P , R ) : BOOLEEN
   SOIENT
       Li1 , Li2 , Li3 UNE LISTE DE ( ENTIER , BOOLEEN ) ;
       R , E UN ARB DE ( ENTIER , BOOLEEN ) ;
       Pp1 UNE PILE DE ARB DE ( ENTIER , BOOLEEN ) ;
       Pp2 UNE PILE DE ( ENTIER , BOOLEEN ) ;
       P , Ph UNE PILE ;
       Inf : ( ENTIER , BOOLEEN ) ;
       Num : ENTIER ;
   DEBUT
       SI R <> NIL
           CREERPILE ( Pp1 ) ;
           CREERPILE ( Pp2 ) ;
           CREERPILE ( Ph ) ;
           E := R ;
           EMPILER ( Pp1 , E ) ;
           TQ PILEVIDE ( Pp1 ) = FAUX :
               DEPILER ( Pp1 , E ) ;
               EMPILER ( Pp2 , INFO ( E ) ) ;
               SI ( FD ( E ) = NIL ) ET ( FG ( E ) = NIL ) :
                   TQ PILEVIDE ( Pp2 ) = FAUX :
                       DEPILER ( Pp2 , Inf ) ;
                       ALLOUER ( Li3 ) ;
                       AFF_VAL ( Li3 , Inf ) ;
                       SI Li2 = NIL :
                           Li2 := Li3 ;
                       SINON
                           AFF_ADR ( Li2 , Li3 ) ;
                           Li2 := Li3 ;
                       FSI ;
                       SI Li1 = NIL :
                           Li1 := Li3 ;
                       FSI ;
                   FTQ ;
               SINON
                   SI FD ( E ) <> NIL :
                       EMPILER ( Pp1 , FD ( E ) ) ;
                   FSI ;
                   SI FG ( E ) <> NIL :
                       EMPILER ( Pp1 , FG ( E ) ) ;
                   FSI ;
               FSI ;
           FTQ ;
       FSI ;
       Verify_1 := VRAI ;
       TQ Li1 <> NIL :
           SI PILEVIDE ( P ) = VRAI :
               Verify_1 := FAUX ;
           SINON
               DEPILER ( P , Num ) ;
               Inf := VALEUR ( Li1 ) ;
               SI ( Num <> STRUCT ( Inf , 1 ) ) OU ( STRUCT ( Inf , 2 ) = FAUX ) :
                   Verify_1 := FAUX ;
               FSI ;
           FSI ;
           EMPILER ( Ph , Num ) ;
           Li2 := SUIVANT ( Li1 ) ;
           LIBERER ( Li1 ) ;
           Li1 := Li2 ;
       FTQ ;
       SI PILEVIDE ( P ) = FAUX :
           Verify_1 := FAUX ;
       FSI ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , Num ) ;
           EMPILER ( P , Num ) ;
       FTQ ;
       Li1 := NIL ;
       Li2 := NIL ;
       Li3 := NIL ;
   FIN
  /*--------------------------------------------------------------------------*/
   FONCTION Verify_3 ( P , R ) : BOOLEEN
   SOIENT
       Li1 , Li2 , Li3 UNE LISTE DE ( ENTIER , BOOLEEN ) ;
       R , E UN ARB DE ( ENTIER , BOOLEEN ) ;
       Pp1 UNE PILE DE ARB DE ( ENTIER , BOOLEEN ) ;
       Pp2 UNE PILE DE ( ENTIER , BOOLEEN ) ;
       P , Ph UNE PILE ;
       Inf : ( ENTIER , BOOLEEN ) ;
       Num : ENTIER ;
   DEBUT
       SI R <> NIL
           CREERPILE ( Pp1 ) ;
           CREERPILE ( Pp2 ) ;
           CREERPILE ( Ph ) ;
           E := R ;
           EMPILER ( Pp1 , E ) ;
           TQ PILEVIDE ( Pp1 ) = FAUX :
               DEPILER ( Pp1 , E ) ;
               EMPILER ( Pp2 , INFO ( E ) ) ;
               SI ( FD ( E ) = NIL ) ET ( FG ( E ) = NIL ) :
                   TQ PILEVIDE ( Pp2 ) = FAUX :
                       DEPILER ( Pp2 , Inf ) ;
                       ALLOUER ( Li3 ) ;
                       AFF_VAL ( Li3 , Inf ) ;
                       SI Li2 = NIL :
                           Li2 := Li3 ;
                       SINON
                           AFF_ADR ( Li2 , Li3 ) ;
                           Li2 := Li3 ;
                       FSI ;
                       SI Li1 = NIL :
                           Li1 := Li3 ;
                       FSI ;
                   FTQ ;
               SINON
                   SI FG ( E ) <> NIL :
                       EMPILER ( Pp1 , FG ( E ) ) ;
                   FSI ;
                   SI FD ( E ) <> NIL :
                       EMPILER ( Pp1 , FD ( E ) ) ;
                   FSI ;
               FSI ;
           FTQ ;
       FSI ;
       Verify_3 := VRAI ;
       TQ Li1 <> NIL :
           SI PILEVIDE ( P ) = VRAI :
               Verify_3 := FAUX ;
           SINON
               DEPILER ( P , Num ) ;
               Inf := VALEUR ( Li1 ) ;
               SI ( Num <> STRUCT ( Inf , 1 ) ) OU ( STRUCT ( Inf , 2 ) = FAUX ) :
                   Verify_3 := FAUX ;
               FSI ;
           FSI ;
           EMPILER ( Ph , Num ) ;
           Li2 := SUIVANT ( Li1 ) ;
           LIBERER ( Li1 ) ;
           Li1 := Li2 ;
       FTQ ;
       SI PILEVIDE ( P ) = FAUX :
           Verify_3 := FAUX ;
       FSI ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , Num ) ;
           EMPILER ( P , Num ) ;
       FTQ ;
       Li1 := NIL ;
       Li2 := NIL ;
       Li3 := NIL ;
   FIN
  /*-------------------------------------------------------------------*/
   ACTION Liberer_arbre ( R )
   SOIT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
   DEBUT
       SI R <> NIL
           APPEL Liberer_arbre ( FG ( R ) ) ;
           APPEL Liberer_arbre ( FD ( R ) ) ;
           LIBERERNOEUD ( R ) ;
       FSI ;
   FIN
  /*-----------------------------------------------------------------------*/
   ACTION Initialize_tree ( R )
   SOIT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
       N : ( ENTIER , BOOLEEN ) ;
   DEBUT
       SI R <> NIL
           APPEL Initialize_tree ( FG ( R ) ) ;
           APPEL Initialize_tree ( FD ( R ) ) ;
           INIT_STRUCT ( N , [ STRUCT ( INFO ( R ) , 1 ) , FAUX ] ) ;
           AFF_INFO ( R , N ) ;
       FSI ;
   FIN
  /*------------------------------------------------------------------------*/
   ACTION Viderpile ( P )
   SOIT
       P UNE PILE ;
       N UN ENTIER ;
   DEBUT
       TQ PILEVIDE ( P ) = FAUX :
           DEPILER ( P , N ) ;
       FTQ ;
   FIN
  /*----------------------------------------------------------------------*/
   ACTION Inorder ( R , P )
   SOIENT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
       P UNE PILE ;
   DEBUT
       SI R <> NIL :
           APPEL Inorder ( FG ( R ) , P ) ;
           EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
           APPEL Inorder ( FD ( R ) , P ) ;
       FSI ;
   FIN
  /*----------------------------------------------------------------------*/
   FONCTION Verifie_arb ( R ) : BOOLEEN
   SOIENT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
       P UNE PILE ;
       N1 , N2 : ENTIER ;
   DEBUT
       APPEL Inorder ( R , P ) ;
       Verifie_arb := VRAI ;
       SI PILEVIDE ( P ) = FAUX :
           DEPILER ( P , N1 ) ;
           TQ PILEVIDE ( P ) = FAUX :
               DEPILER ( P , N2 ) ;
               SI N2 >= N1 :
                   Verifie_arb := FAUX ;
               FSI ;
               N1 := N2 ;
           FTQ ;
       FSI ;
   FIN
  /*---------------------------------------------------------------*/
   ACTION Travers_2 ( R , P )
   SOIENT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , P2 UNE PILE ;
   DEBUT
       CREERPILE ( P2 ) ;
       TQ ( ( FG ( R ) <> NIL ) OU ( FD ( R ) <> NIL ) ) ET ( ( FG ( R ) <> NIL ) OU ( STRUCT ( INFO ( FD ( R ) ) , 2
       ) <> VRAI ) ) ET ( ( FD ( R ) <> NIL ) OU ( STRUCT ( INFO ( FG ( R ) ) , 2 ) <> VRAI ) ) ET ( ( STRUCT ( INFO (
       FD ( R ) ) , 2 ) <> VRAI ) OU ( STRUCT ( INFO ( FG ( R ) ) , 2 ) <> VRAI ) ) :
           APPEL Take_leafs_2 ( R , P ) ;
       FTQ ;
       EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
       TQ PILEVIDE ( P ) = FAUX :
           DEPILER ( P , H ) ;
           EMPILER ( P2 , H ) ;
       FTQ ;
       P := P2 ;
   FIN
  /*-----------------------------------------------------*/
   ACTION Take_leafs_2 ( R , P )
   SOIENT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
       P UNE PILE ;
       M : ( ENTIER , BOOLEEN ) ;
   DEBUT
       SI ( R <> NIL ) :
           SI ( STRUCT ( INFO ( R ) , 2 ) = FAUX ) :
               SI ( FG ( R ) = NIL ) ET ( FD ( R ) = NIL ) :
                   EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                   INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                   AFF_INFO ( R , M ) ;
               SINON
                   SI FG ( R ) = NIL :
                       SI STRUCT ( INFO ( FD ( R ) ) , 2 ) = VRAI :
                           EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                           INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                           AFF_INFO ( R , M ) ;
                       FSI ;
                   SINON
                       SI FD ( R ) = NIL :
                           SI STRUCT ( INFO ( FG ( R ) ) , 2 ) = VRAI :
                               EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                               INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                               AFF_INFO ( R , M ) ;
                           FSI ;
                       SINON
                           SI STRUCT ( INFO ( FG ( R ) ) , 2 ) = VRAI :
                               SI STRUCT ( INFO ( FD ( R ) ) , 2 ) = VRAI :
                                   EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                                   INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                                   AFF_INFO ( R , M ) ;
                               FSI ;
                           FSI ;
                       FSI ;
                   FSI ;
               FSI ;
               APPEL Take_leafs_2 ( FG ( R ) , P ) ;
               APPEL Take_leafs_2 ( FD ( R ) , P ) ;
           FSI ;
       FSI ;
   FIN
  /*---------------------------------------------------*/
   ACTION Travers_4 ( R , P )
   SOIENT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , P2 UNE PILE ;
   DEBUT
       CREERPILE ( P2 ) ;
       TQ ( ( FG ( R ) <> NIL ) OU ( FD ( R ) <> NIL ) ) ET ( ( FG ( R ) <> NIL ) OU ( STRUCT ( INFO ( FD ( R ) ) , 2
       ) <> VRAI ) ) ET ( ( FD ( R ) <> NIL ) OU ( STRUCT ( INFO ( FG ( R ) ) , 2 ) <> VRAI ) ) ET ( ( STRUCT ( INFO (
       FD ( R ) ) , 2 ) <> VRAI ) OU ( STRUCT ( INFO ( FG ( R ) ) , 2 ) <> VRAI ) ) :
           APPEL Take_leafs_4 ( R , P ) ;
       FTQ ;
       EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
       TQ PILEVIDE ( P ) = FAUX :
           DEPILER ( P , H ) ;
           EMPILER ( P2 , H ) ;
       FTQ ;
       P := P2 ;
   FIN
  /*-----------------------------------------------------*/
   ACTION Take_leafs_4 ( R , P )
   SOIENT
       R UN ARB DE ( ENTIER , BOOLEEN ) ;
       P UNE PILE ;
       M : ( ENTIER , BOOLEEN ) ;
   DEBUT
       SI ( R <> NIL ) :
           SI ( STRUCT ( INFO ( R ) , 2 ) = FAUX ) :
               SI ( FG ( R ) = NIL ) ET ( FD ( R ) = NIL ) :
                   EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                   INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                   AFF_INFO ( R , M ) ;
               SINON
                   SI FG ( R ) = NIL :
                       SI STRUCT ( INFO ( FD ( R ) ) , 2 ) = VRAI :
                           EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                           INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                           AFF_INFO ( R , M ) ;
                       FSI ;
                   SINON
                       SI FD ( R ) = NIL :
                           SI STRUCT ( INFO ( FG ( R ) ) , 2 ) = VRAI :
                               EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                               INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                               AFF_INFO ( R , M ) ;
                           FSI ;
                       SINON
                           SI STRUCT ( INFO ( FG ( R ) ) , 2 ) = VRAI :
                               SI STRUCT ( INFO ( FD ( R ) ) , 2 ) = VRAI :
                                   EMPILER ( P , STRUCT ( INFO ( R ) , 1 ) ) ;
                                   INIT_STRUCT ( M , [ STRUCT ( INFO ( R ) , 1 ) , VRAI ] ) ;
                                   AFF_INFO ( R , M ) ;
                               FSI ;
                           FSI ;
                       FSI ;
                   FSI ;
               FSI ;
               APPEL Take_leafs_4 ( FD ( R ) , P ) ;
               APPEL Take_leafs_4 ( FG ( R ) , P ) ;
           FSI ;
       FSI ;
   FIN
  /*---------------------------------------------------------------------------*/
   FONCTION Verify_2 ( R , P ) : BOOLEEN
   SOIENT
       R , R1 UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , Ph , Ph1 UNE PILE ;
       N , N1 UN ENTIER ;
   DEBUT
       CREERPILE ( Ph ) ;
       CREERPILE ( Ph1 ) ;
       Verify_2 := VRAI ;
       TQ ( FG ( R ) <> NIL ) OU ( FD ( R ) <> NIL ) :
           APPEL Delete_leafs_2 ( R , Ph ) ;
       FTQ ;
       EMPILER ( Ph , STRUCT ( INFO ( R ) , 1 ) ) ;
       LIBERERNOEUD ( R ) ;
       R := NIL ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , N ) ;
           EMPILER ( Ph1 , N ) ;
       FTQ ;
       TQ ( PILEVIDE ( P ) = FAUX ) ET ( PILEVIDE ( Ph1 ) = FAUX ) :
           DEPILER ( P , N ) ;
           EMPILER ( Ph , N ) ;
           DEPILER ( Ph1 , N1 ) ;
           SI N <> N1 :
               Verify_2 := FAUX ;
           FSI ;
       FTQ ;
       SI ( PILEVIDE ( Ph1 ) = FAUX ) OU ( PILEVIDE ( P ) = FAUX ) :
           Verify_2 := FAUX ;
       FSI ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , N ) ;
           EMPILER ( P , N ) ;
       FTQ ;
   FIN
  /*---------------------------------------------------------------------*/
   ACTION Delete_leafs_2 ( R , P2 )
   SOIENT
       R , R1 UN ARB DE ( ENTIER , BOOLEEN ) ;
       P2 UNE PILE ;
       N UN ENTIER ;
   DEBUT
       SI R <> NIL :
           SI ( FG ( R ) = NIL ) ET ( FD ( R ) = NIL ) :
               EMPILER ( P2 , STRUCT ( INFO ( R ) , 1 ) ) ;
               R1 := PERE ( R ) ;
               SI FG ( R1 ) = R :
                   AFF_FG ( R1 , NIL ) ;
               SINON
                   AFF_FD ( R1 , NIL ) ;
               FSI ;
               LIBERERNOEUD ( R ) ;
           SINON
               APPEL Delete_leafs_2 ( FG ( R ) , P2 ) ;
               APPEL Delete_leafs_2 ( FD ( R ) , P2 ) ;
           FSI
       FSI ;
   FIN
  /*-----------------------------------------------------------------------*/
   FONCTION Verify_4 ( R , P ) : BOOLEEN
   SOIENT
       R , R1 UN ARB DE ( ENTIER , BOOLEEN ) ;
       P , Ph , Ph1 UNE PILE ;
       N , N1 UN ENTIER ;
   DEBUT
       CREERPILE ( Ph ) ;
       CREERPILE ( Ph1 ) ;
       Verify_4 := VRAI ;
       TQ ( FG ( R ) <> NIL ) OU ( FD ( R ) <> NIL ) :
           APPEL Delete_leafs_4 ( R , Ph ) ;
       FTQ ;
       EMPILER ( Ph , STRUCT ( INFO ( R ) , 1 ) ) ;
       LIBERERNOEUD ( R ) ;
       R := NIL ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , N ) ;
           EMPILER ( Ph1 , N ) ;
       FTQ ;
       TQ ( PILEVIDE ( P ) = FAUX ) ET ( PILEVIDE ( Ph1 ) = FAUX ) :
           DEPILER ( P , N ) ;
           EMPILER ( Ph , N ) ;
           DEPILER ( Ph1 , N1 ) ;
           SI N <> N1 :
               Verify_4 := FAUX ;
           FSI ;
       FTQ ;
       SI ( PILEVIDE ( Ph1 ) = FAUX ) OU ( PILEVIDE ( P ) = FAUX ) :
           Verify_4 := FAUX ;
       FSI ;
       TQ PILEVIDE ( Ph ) = FAUX :
           DEPILER ( Ph , N ) ;
           EMPILER ( P , N ) ;
       FTQ ;
   FIN
  /*---------------------------------------------------------------------*/
   ACTION Delete_leafs_4 ( R , P2 )
   SOIENT
       R , R1 UN ARB DE ( ENTIER , BOOLEEN ) ;
       P2 UNE PILE ;
       N UN ENTIER ;
   DEBUT
       SI R <> NIL :
           SI ( FG ( R ) = NIL ) ET ( FD ( R ) = NIL ) :
               EMPILER ( P2 , STRUCT ( INFO ( R ) , 1 ) ) ;
               R1 := PERE ( R ) ;
               SI FG ( R1 ) = R :
                   AFF_FG ( R1 , NIL ) ;
               SINON
                   AFF_FD ( R1 , NIL ) ;
               FSI ;
               LIBERERNOEUD ( R ) ;
           SINON
               APPEL Delete_leafs_4 ( FD ( R ) , P2 ) ;
               APPEL Delete_leafs_4 ( FG ( R ) , P2 ) ;
           FSI
       FSI ;
   FIN
  /*-----------------------------------------------------------------------*/
