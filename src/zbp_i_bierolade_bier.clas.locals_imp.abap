CLASS lhc_Bier DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    CONSTANTS: BEGIN OF beerStatus,
                 Accepted TYPE c LENGTH 30 VALUE 'Accepted',
                 Rejected TYPE c LENGTH 30 VALUE 'Rejected',
               END OF beerStatus.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Bier RESULT result.

    METHODS AcceptBeer FOR MODIFY
      IMPORTING keys FOR ACTION Bier~AcceptBeer RESULT result.

*    METHODS recalculatePrice FOR MODIFY
*      IMPORTING keys FOR ACTION Bier~recalculatePrice.

    METHODS RejectBeer FOR MODIFY
      IMPORTING keys FOR ACTION Bier~RejectBeer RESULT result.
*
*    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
*      IMPORTING keys FOR Bier~calculateTotalPrice.
*
*    METHODS setInitialRating FOR DETERMINE ON MODIFY
*      IMPORTING keys FOR Bier~setInitialRating.
*
*    METHODS validateBrewery FOR VALIDATE ON SAVE
*      IMPORTING keys FOR Bier~validateBrewery.
*
*    METHODS validateName FOR VALIDATE ON SAVE
*      IMPORTING keys FOR Bier~validateName.

ENDCLASS.

CLASS lhc_Bier IMPLEMENTATION.

  METHOD get_instance_features.
    " Read the status of the existing beers
    READ ENTITIES OF zi_bierolade_bier IN LOCAL MODE
      ENTITY Bier
        FIELDS ( Status ) WITH CORRESPONDING #( keys )
      RESULT DATA(beers)
      FAILED failed.

    result =
      VALUE #(
        FOR beer IN beers
          LET is_accepted =   COND #( WHEN beer-Status = beerstatus-accepted
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled  )
              is_rejected =   COND #( WHEN beer-Status  = beerstatus-rejected
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled )
          IN
            ( %tky                 = beer-%tky
              %action-AcceptBeer = is_accepted
              %action-RejectBeer = is_rejected
             ) ).

  ENDMETHOD.

  METHOD AcceptBeer.
*    "update Status
*    MODIFY ENTITIES OF zi_bierolade_bier IN LOCAL MODE
*     ENTITY Bier
*     UPDATE FIELDS ( Status )
*     WITH VALUE #( FOR key IN keys (
*                         %tky = key-%tky
*                         Status = beerStatus-accepted ) )
*
*    FAILED failed
*    REPORTED reported.
*
*    "Fill in the response table
*    READ ENTITIES OF zi_bierolade_bier  IN LOCAL MODE
*      ENTITY Bier
*      ALL FIELDS WITH CORRESPONDING #( keys )
*          RESULT DATA(lt_beers).
*
*    result = VALUE #( FOR beer IN lt_beers
*                      (  %tky = beer-%tky
*                         %param = beer ) ).


      " set the new overall status

    MODIFY ENTITIES OF zi_bierolade_bier IN LOCAL MODE
    ENTITY Bier
    UPDATE FIELDS (  Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = beerStatus-accepted ) )

    FAILED failed
    REPORTED reported.

    " fill the response table
    READ ENTITIES OF zi_bierolade_bier IN LOCAL MODE
        ENTITY Bier
        ALL FIELDS WITH CORRESPONDING #( keys )
            RESULT DATA(beers).

    result = VALUE #( FOR beer IN beers ( %tky = beer-%tky %param = beer ) ).


  ENDMETHOD.

*  METHOD recalculatePrice.
*  ENDMETHOD.

  METHOD RejectBeer.

    "Fill in the response table
    READ ENTITIES OF zi_bierolade_bier  IN LOCAL MODE
      ENTITY Bier
      ALL FIELDS WITH CORRESPONDING #( keys )
          RESULT DATA(lt_beers).

    result = VALUE #( FOR beer IN lt_beers
                      (  %tky = beer-%tky
                       %param = beer ) ).

  ENDMETHOD.

*  METHOD calculateTotalPrice.
*  ENDMETHOD.
*
*  METHOD setInitialRating.
*  ENDMETHOD.
*
*  METHOD validateBrewery.
*  ENDMETHOD.
*
*  METHOD validateName.
*  ENDMETHOD.

ENDCLASS.
