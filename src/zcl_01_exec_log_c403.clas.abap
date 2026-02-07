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


** Instance
**    DATA: lo_ins TYPE REF TO  zcl_02_basics_log_c403.
**
**    CREATE OBJECT lo_ins.
*
*    DATA(lo_instance) = NEW zcl_02_basics_log_c403( ).
*
*    lo_instance->set_attr( 'Value1' ).
*    lo_instance->get_attr(
*      IMPORTING
*        attr1 = DATA(lv_attr1) ).
*
*    zcl_02_basics_log_c403=>set_attr2( 'Value2' ).
*    zcl_02_basics_log_c403=>get_attr2(
*      IMPORTING
*        ev_attr2 = DATA(lv_attr2) ).
*
*    out->write( lv_attr1 ).
*    out->write( lv_attr2 ).
*
*
*    out->write( zcl_02_basics_log_c403=>c_saludo ).
*    out->write( zcl_02_basics_log_c403=>c_logali-c_master ).
*
** Método funcional
*
**   lo_instance->get_flights(
**      EXPORTING
**        iv_flight = '00000009'
**        iv_agency = '0002'
**      RECEIVING
**        rv_exist  = data(lv_exist)
**    ).
*
*
*
*    IF lo_instance->get_flights(
*       EXPORTING
*         iv_flight = '00000009'
*         "iv_agency = '000000'
*         ) EQ abap_true.
*
*      out->write( 'Exists' ).
*    ELSE.
*      out->write( 'Does not Exist' ).
*
*    ENDIF.
*
*
*    out->write( lo_instance->get_flight( '00000009' ) ).
*
*    out->write( lo_instance->company ).
*
*    "lo_instance->company = 'Coca cola'.
*
*    "out->write( lo_instance->company ).


** Instances - Constructors
*
*  data(lo_instance) = new zcl_03_instances_log_c403( ).
*
*  out->write( zcl_03_instances_log_c403=>log ).
*
*  data(lo_instance2) = new zcl_03_instances_log_c403( ).
*
*  out->write( zcl_03_instances_log_c403=>log ).


* Heritance
*  data(lo_heritance) = new zcl_05_heritance_log_c403( ).
*
*  out->write( lo_heritance->get_architecture( ) ).
*
*  "lo_heritance->architecture = '32 bits'.

** Narrowing Cast --> UP cast
*    DATA(lo_animal) = NEW zcl_06_animal_log_c403( ).
*    DATA(lo_lion) = NEW zcl_07_lion_log_c403( ).
*
*    out->write( lo_animal->walk( ) ).
*    out->write( lo_lion->walk( ) ).
*
*    lo_animal = lo_lion.
*
*    out->write( 'Narrowing (Up cast)' ).
*    out->write( lo_animal->walk( ) ).
*
** Widening cast --> Down Cast
*    TRY.
*        lo_lion ?= lo_animal.
*      CATCH cx_sy_move_cast_error.
*    ENDTRY.
*
*    out->write( 'Widening (Down cast)' ).
*    out->write( lo_animal->walk( ) ).
*    out->write( lo_lion->walk( ) ).

* Instances encapsulation
* data(lo_encap) = new zcl_09_friends_her_log_c403( ).
*
* lo_encap->get_friend_data( ).


** Interfaces
*  data(lo_interf) = new zcl_11_interfaces_log_c403( ).
*
*  "lo_interf->zif_01_log_c403~set_conn_id( '0001' ).
*  lo_interf->set_conn_id( '0001' ).
*
*  out->write( lo_interf->zif_01_log_c403~get_conn_id( ) ).
*
*  out->write( lo_interf->zif_02_log_c403~get_customer( '000004' ) ).


* Polymorphism
    DATA: lt_airplanes TYPE STANDARD TABLE OF REF TO zcl_15_airplane_log_c403,
          lo_airplane  TYPE REF TO zcl_15_airplane_log_c403,
          lo_cargo     TYPE REF TO zcl_16_cargo_plane_log_c403,
          lo_pass      TYPE REF TO zcl_17_pass_plane_log_c403.

    lo_cargo = NEW #( ).
    APPEND lo_cargo TO lt_airplanes.

    lo_pass = NEW #( ).
    APPEND lo_pass TO lt_airplanes.

    LOOP AT lt_airplanes INTO lo_airplane.
      out->write( lo_airplane->airplane_type( ) ).
    ENDLOOP.





























  ENDMETHOD.



ENDCLASS.
