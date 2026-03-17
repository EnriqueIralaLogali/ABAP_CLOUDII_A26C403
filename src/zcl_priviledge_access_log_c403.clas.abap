CLASS zcl_priviledge_access_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_priviledge_access_log_c403 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    SELECT FROM zcds_35_log_c403 WITH PRIVILEGED ACCESS
    FIELDS *
    INTO TABLE @DATA(lt_results)
    UP TO 50 ROWS.

    IF sy-subrc = 0.
      out->write( lt_results ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
