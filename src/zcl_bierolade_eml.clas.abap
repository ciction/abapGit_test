CLASS zcl_bierolade_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bierolade_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*=====================================================================================
*    "STEP 1  -  READ
*=====================================================================================
*    READ ENTITIES OF zi_bierolade_bier
*     ENTITY Bier
*         FROM VALUE #( ( BeerId = '020A45DC0A821EDB9CDBD96C89D75BEB' ) )
*         RESULT DATA(lt_beers).
*
*    out->write( lt_beers ).
*---------------------------------------------------------------------------------------



*=====================================================================================
*    "STEP 2  -  READ WITH FIELDS
*=====================================================================================
*    READ ENTITIES OF zi_bierolade_bier
*     ENTITY Bier
*         FIELDS ( Brewery Name Style Descr )
*         WITH VALUE #( ( BeerId = '020A45DC0A821EDB9CDBD96C89D75BEB' ) )
*         RESULT DATA(lt_beers).
*
*    out->write( lt_beers ).
*---------------------------------------------------------------------------------------


**=====================================================================================
**    "STEP 3  -  READ ALL FIELDS
**=====================================================================================
*    READ ENTITIES OF zi_bierolade_bier
*     ENTITY Bier
*        ALL FIELDS WITH
*         VALUE #( ( BeerId = '020A45DC0A821EDB9CDBD96C89D75BEB' ) )
*         RESULT DATA(lt_beers).
*
*    out->write( lt_beers ).
**---------------------------------------------------------------------------------------


**=====================================================================================
**    "STEP 4  -  READ BY ASSOCIATION (get all ratings for this beer)
**=====================================================================================
*    READ ENTITIES OF zi_bierolade_bier
*     ENTITY Bier BY \_Rating
*         ALL FIELDS WITH VALUE #( ( BeerId = '020A45DC0A821EDB9CDBD96C89D75BEB' ) )
*         RESULT DATA(lt_ratings).
*
*    out->write( lt_ratings ).
**---------------------------------------------------------------------------------------


**=====================================================================================
**    "STEP 5  -  UNSUCCESSFUL READ
**=====================================================================================
*    READ ENTITIES OF zi_bierolade_bier
*     ENTITY Bier
*         ALL FIELDS WITH VALUE #( ( BeerId = '13456' ) )
*         RESULT DATA(lt_beers)
*         FAILED DATA(lt_failed)
*         REPORTED DATA(lt_reported).
*
*    out->write( lt_beers ).
*    out->write( lt_failed ).   "complex sturcture (not supported by console)
*    out->write( lt_reported ). "complex sturcture (not supported by console)
**---------------------------------------------------------------------------------------



**=====================================================================================
**    "STEP 6  -  MODIFY UPDATE
**=====================================================================================
*    MODIFY ENTITIES OF zi_bierolade_bier
*     ENTITY Bier
*        UPDATE
*        SET FIELDS WITH VALUE #( ( BeerId = '020A45DC0A821EDB9CDBD96C89D75BEB'
*                                   Descr = 'RAP test' ) )
*         FAILED DATA(lt_failed)
*         REPORTED DATA(lt_reported).
*
**
*    COMMIT ENTITIES
*        RESPONSE OF zi_bierolade_bier
*        FAILED DATA(lt_failed_commit)
*        REPORTED DATA(lt_reported_commit).

*    out->write('update finished').
**---------------------------------------------------------------------------------------


*=====================================================================================
*    "STEP 7  -  MODIFY CREATE
*=====================================================================================
    MODIFY ENTITIES OF zi_bierolade_bier
     ENTITY Bier
        CREATE
        SET FIELDS WITH VALUE #( (  %cid = 'My_content_ID'
                                    Name = 'My_beer'
                                    Brewery = 'My_berwery'
                                    Descr = 'RAP test'
                                    Style = 'Stout'
                                    ImageUrl = 'https://miro.medium.com/max/256/1*d69DKqFDwBZn_23mizMWcQ.png' ) )

         MAPPED DATA(lt_mapped)
         FAILED DATA(lt_failed)
         REPORTED DATA(lt_reported).


    out->write( lt_mapped-bier ).

    COMMIT ENTITIES
        RESPONSE OF zi_bierolade_bier
        FAILED DATA(lt_failed_commit)
        REPORTED DATA(lt_reported_commit).

    out->write('create finished').
*---------------------------------------------------------------------------------------




  ENDMETHOD.

ENDCLASS.

