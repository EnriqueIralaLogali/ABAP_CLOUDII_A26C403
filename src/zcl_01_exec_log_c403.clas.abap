CLASS zcl_01_exec_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_exec_log_c403 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*    out->write( 'Hola Logali' ).


* Instance
*    DATA: lo_ins TYPE REF TO  zcl_02_basics_log_c403.
*
*    CREATE OBJECT lo_ins.

    DATA(lo_instance) = NEW zcl_02_basics_log_c403( ).

    lo_instance->set_attr( 'Value1' ).
    lo_instance->get_attr(
      IMPORTING
        attr1 = data(lv_attr1) ).

    zcl_02_basics_log_c403=>set_attr2( 'Value2' ).
    zcl_02_basics_log_c403=>get_attr2(
      IMPORTING
        ev_attr2 = data(lv_attr2) ).

  out->write( lv_attr1 ).
  out->write( lv_attr2 ).

























  ENDMETHOD.



ENDCLASS.
