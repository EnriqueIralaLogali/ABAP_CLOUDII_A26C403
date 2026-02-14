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
*    DATA: lt_airplanes TYPE STANDARD TABLE OF REF TO zcl_15_airplane_log_c403,
*          lo_airplane  TYPE REF TO zcl_15_airplane_log_c403,
*          lo_cargo     TYPE REF TO zcl_16_cargo_plane_log_c403,
*          lo_pass      TYPE REF TO zcl_17_pass_plane_log_c403.
*
*    lo_cargo = NEW #( ).
*    APPEND lo_cargo TO lt_airplanes.
*
*    lo_pass = NEW #( ).
*    APPEND lo_pass TO lt_airplanes.
*
*    LOOP AT lt_airplanes INTO lo_airplane.
*      out->write( lo_airplane->airplane_type( ) ).
*    ENDLOOP.


* Polymorphism wit interfaces
*    DATA: lt_companies   TYPE STANDARD TABLE OF REF TO zif_04_log_c403,
*          lo_company     TYPE REF TO zif_04_log_c403,
*          lo_company_eu  TYPE REF TO zcl_18_company_eu_log_c403,
*          lo_company_usa TYPE REF TO zcl_19_company_usa_log_c403,
*          lo_plant       TYPE REF TO zcl_20_plant_log_c403.
*
*    lo_company_eu = NEW #( ).
*    APPEND lo_company_eu TO lt_companies.
*
*    lo_company_usa = NEW #( ).
*    APPEND lo_company_usa TO lt_companies.
*
*    lo_plant = NEW #( ).
*
*    LOOP AT lt_companies INTO lo_company.
*      out->write( lo_company->define_company( ) ).
*      out->write( lo_plant->assign_company( lo_company ) ).
*    ENDLOOP.


* Association
*    DATA(lo_credit_card) = NEW zcl_21_credit_card_log_c403( ).
*    DATA(lo_client) = NEW zcl_22_client_log_c403( ).
*
*    lo_credit_card->set_card_num( '7777 8888 3333 4444' ).
*
*    lo_client->set_credit_card( lo_credit_card ).
*
*    out->write( lo_client->get_credit_card( )->get_card_num( ) ).


* Composition
*    DATA(lo_keyboard) = NEW zcl_23_keyboard_log_c403( ).
*    DATA(lo_laptop) = NEW zcl_24_laptop_log_c403( lo_keyboard ).
*
*    lo_keyboard->keyboard_type = 'ES'.
*
*    out->write( lo_laptop->keyboard->keyboard_type ).


* Generic class OBJECT
*    DATA: lo_object TYPE REF TO object.
*
*    lo_object = NEW zcl_25_product_log_c403( ).
*
*    DATA(lv_method) = 'RETURN_CATEGORY'.
*
*    DATA: lv_category TYPE string.
*
*    CALL METHOD lo_object->(lv_method) RECEIVING rv_category = lv_category.
*
*    out->write( lv_category ).

* Events
*    DATA(lo_timer) = NEW zcl_26_timer_log_c403( ).
*    DATA(lo_conexion) = NEW zcl_27_conexion_log_c403( ).
*
*    " Handler Reference
*    SET HANDLER lo_conexion->on_time_out FOR lo_timer.
*
*    DO.
*      WAIT UP TO 1 SECONDS.
*      lo_timer->increment_counter( 1 ).
*
*      IF lo_conexion->hour IS INITIAL.
*        out->write( |Event not yet executed: { cl_abap_context_info=>get_system_time( ) }| ).
*      ELSE.
*        out->write( |Event was raised at: { lo_conexion->hour }-{ lo_conexion->sender_user }| ).
*        EXIT.
*      ENDIF.
*
*    ENDDO.


* Events with interfaces
*    DATA(lo_americanbank) = NEW zcl_28_bank_log_c403( ).
*    DATA(lo_bankclient) = NEW zcl_29_bankclient_log_c403( ).
*
*    SET HANDLER lo_bankclient->on_new_transfer FOR lo_americanbank ACTIVATION abap_true.
*
*    DO 5 TIMES.
*      WAIT UP TO 1 SECONDS.
*      out->write( lo_americanbank->create_notification( ) ).
*      out->write( lo_bankclient->notification ).
*
*      IF sy-index = 3.
*        SET HANDLER lo_bankclient->on_new_transfer FOR lo_americanbank ACTIVATION abap_false.
*        lo_bankclient->notification = 'No handler for event new transfer'.
*      ENDIF.
*    ENDDO.

  data(lv_result) = 5 / 0.








































  ENDMETHOD.
ENDCLASS.
