CLASS zcl_use_in_cloud_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_use_in_cloud_c403 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    SELECT FROM /DMO/I_Agency
    FIELDS *
     INTO TABLE @DATA(lt_results).

    out->write( lt_results ).
  ENDMETHOD.

ENDCLASS.
