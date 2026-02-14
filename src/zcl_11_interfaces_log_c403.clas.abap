CLASS zcl_11_interfaces_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      zif_01_log_c403,
      zif_02_log_c403.

    ALIASES: get_conn_id FOR zif_01_log_c403~get_conn_id,
             set_conn_id FOR zif_01_log_c403~set_conn_id,
             get_customer FOR zif_02_log_c403~get_customer.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_11_INTERFACES_LOG_C403 IMPLEMENTATION.


  METHOD get_conn_id.

    rv_conn_id = me->zif_01_log_c403~conn_id.

  ENDMETHOD.


  METHOD set_conn_id.

    me->zif_01_log_c403~conn_id = iv_conn_id.

  ENDMETHOD.


  METHOD get_customer.

    SELECT SINGLE FROM /dmo/customer
    FIELDS first_name,
           last_name
    INTO @rs_cust_address.

  ENDMETHOD.


  METHOD zif_03_log_c403~get_airports.

  ENDMETHOD.
ENDCLASS.
