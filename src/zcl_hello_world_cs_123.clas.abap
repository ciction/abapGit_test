CLASS zcl_hello_world_cs_123 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HELLO_WORLD_CS_123 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( |Hello { cl_abap_context_info=>get_user_alias(  ) }| ).
  ENDMETHOD.
ENDCLASS.
