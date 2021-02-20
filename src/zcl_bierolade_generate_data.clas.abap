CLASS zcl_bierolade_generate_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BIEROLADE_GENERATE_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_beers     TYPE TABLE OF zbierolade_beer,
          lt_ratings   TYPE TABLE OF zbierolade_rate,
          lt_breweries TYPE TABLE OF zbier_breweries.

    TYPES: ty_bierolade_stuct TYPE zbierolade_beer,
           ty_rating_stuct    TYPE zbierolade_rate.

*    Clear the database tables
    DELETE FROM zbierolade_beer.
    DELETE FROM zbierolade_rate.
    DELETE FROM zbier_breweries.

    DATA(lv_id) = cl_system_uuid=>if_system_uuid_rfc4122_static~create_uuid_x16_by_version( version = 4 ).
    DATA(lv_first_beer_id) = lv_id.
    out->write( lv_id ).
    DATA(lv_berwery) = 'Flying dog'.
    DATA(lv_name) = 'Blood Orange Ale'.
    DATA(lv_style) = 'Pale Ale'.
    DATA(lv_abv) = '7.0'.
    DATA(lv_origin) = 'USA'.
    DATA(lv_descr) = 'Fruitige IPA met het onmiskenbare zoete aroma van bloedsinaasappel. Zoet en toch fris. In de finish een geslaagde combinatie van het fruit en de opkomende bitterheid vanuit de hop.'.
    DATA(lv_IMAGE_URL) = 'https://www.beerwulf.com/globalassets/flying-dog-blood-orange-ale.36_1_1?h=500&rev=326466119'.
    DATA(ls_beer) = VALUE ty_bierolade_stuct( beer_id = lv_id  brewery = |{ lv_berwery }| name = |{ lv_name }| style = |{ lv_style }| abv = lv_abv origin = |{ lv_origin }| descr = |{ lv_descr }|  image_url = |{ lv_image_url }| ).
    APPEND ls_beer TO lt_beers.

    lv_id = cl_system_uuid=>if_system_uuid_rfc4122_static~create_uuid_x16_by_version( version = 4 ).
    lv_berwery = 'White Pony Microbrewery'.
    lv_name = 'X.M.A.S'.
    lv_style = 'Saison'.
    lv_abv = '6.2'.
    lv_origin = 'Italy'.
    lv_descr = 'Een donker Winterbier met karaktertrekken van een. Saison. Tonen van geroosterde mout, chocolade en koffie. Zeer toegankelijk. Een bier dat verbroedert, een bier met een echte kerstgedachte.'.
    lv_IMAGE_URL = 'https://www.beerwulf.com/globalassets/catalog/beerwulf/beers/saison/x.m.a.s._white_pony_microbrewery_winter_ale.png?h=500&rev=1955955528'.
    ls_beer = VALUE ty_bierolade_stuct( beer_id = lv_id brewery = |{ lv_berwery }| name = |{ lv_name }| style = |{ lv_style }| abv = lv_abv origin = |{ lv_origin }| descr = |{ lv_descr }|  image_url = |{ lv_image_url }| ).
    APPEND ls_beer TO lt_beers.

    lv_id = cl_system_uuid=>if_system_uuid_rfc4122_static~create_uuid_x16_by_version( version = 4 ).
    lv_berwery = 'Mélusine'.
    lv_name = 'Barbe Bleue'.
    lv_style = 'Stout'.
    lv_abv = '7.0'.
    lv_origin = 'Frankrijk'.
    lv_descr = 'Je ontdekt in de neus vooral koffie, vanille en kruidigheid. Een volle, verwarmende Stout met warme tonen en smaken van karamel en gebrande mouten.'.
    lv_IMAGE_URL = 'https://www.beerwulf.com/globalassets/melusine-barbe-bleue.33_1_1?h=500&rev=2049056795'.
    ls_beer = VALUE ty_bierolade_stuct( beer_id = lv_id brewery = |{ lv_berwery }| name = |{ lv_name }| style = |{ lv_style }| abv = lv_abv origin = |{ lv_origin }| descr = |{ lv_descr }|  image_url = |{ lv_image_url }| ).
    APPEND ls_beer TO lt_beers.

    lv_id = cl_system_uuid=>if_system_uuid_rfc4122_static~create_uuid_x16_by_version( version = 4 ).
    lv_berwery = 'Pohjala '.
    lv_name = 'Must Kuld'.
    lv_style = 'Stout'.
    lv_abv = '7.8'.
    lv_origin = 'Estland'.
    lv_descr = 'Zwartkleurig bier met een roodbruine mousse als schuimkraag. Aromas van bittere chocolade en koffie subtiel afgerond door de lactose. De nasmaak is lang en intens vol koffie en chocolade.'.
    lv_IMAGE_URL = 'https://www.beerwulf.com/globalassets/pohjala-must-kuld.33_1_1?h=500&rev=1425009434'.
    ls_beer = VALUE ty_bierolade_stuct( beer_id = lv_id brewery = |{ lv_berwery }| name = |{ lv_name }| style = |{ lv_style }| abv = lv_abv origin = |{ lv_origin }| descr = |{ lv_descr }|  image_url = |{ lv_image_url }| ).
    APPEND ls_beer TO lt_beers.


**********************************************************************
*Ratings
**********************************************************************
    lv_id = cl_system_uuid=>if_system_uuid_rfc4122_static~create_uuid_x16_by_version( version = 4 ).
    DATA(ls_rating) = VALUE ty_rating_stuct( rating_id = lv_id beer_id = lv_first_beer_id  creator = |Christophe S.| collar = 4 opacity = 3 color = 3 rating = 4 ).
    DATA(ls_smell) = VALUE zbierolade_smell( fruit = 4 malt = 3 spice = 4  ).
    DATA(ls_taste) = VALUE zbierolade_taste( sweet = 2 bitter = 1 body = 3  acidity = 3 ).
    MOVE-CORRESPONDING ls_smell TO ls_rating.
    MOVE-CORRESPONDING ls_taste TO ls_rating.
    APPEND ls_rating TO lt_ratings.

    lv_id = cl_system_uuid=>if_system_uuid_rfc4122_static~create_uuid_x16_by_version( version = 4 ).
    out->write( lv_id ).
    ls_rating = VALUE ty_rating_stuct( rating_id = lv_id beer_id = lv_first_beer_id creator = |Chris| collar = 4 opacity = 4 color = 2 rating = 1 ).
    ls_smell = VALUE zbierolade_smell( fruit = 4 malt = 3 spice = 2  ).
    ls_taste = VALUE zbierolade_taste( sweet = 1 bitter = 2 body = 2  acidity = 2 ).
    MOVE-CORRESPONDING ls_smell TO ls_rating.
    MOVE-CORRESPONDING ls_taste TO ls_rating.
    APPEND ls_rating TO lt_ratings.

**********************************************************************
*Breweries
**********************************************************************


    lt_breweries = VALUE #( ( |Flying dog| )
                            ( |White Pony Microbrewery| )
                            ( |Mélusine| )
                            ( |Pohjala| ) ).



**********************************************************************
*Insert Data
**********************************************************************
*    Insert new data in the 1 tables
    INSERT zbierolade_beer FROM TABLE @lt_beers.
    INSERT zbierolade_rate FROM TABLE @lt_ratings.
    INSERT zbier_breweries FROM TABLE @lt_breweries.

    COMMIT WORK.

    out->write( lt_beers ).
    out->write( lt_ratings ).
    out->write( lt_breweries ).
  ENDMETHOD.
ENDCLASS.
