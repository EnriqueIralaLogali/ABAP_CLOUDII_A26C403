CLASS zcl_02_basics_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS: BEGIN OF c_logali,
                 c_logali  TYPE c LENGTH 6 VALUE 'Logali',
                 c_master  TYPE c LENGTH 15 VALUE 'ABAP Cloud II',
                 c_company TYPE c LENGTH 10 VALUE 'A26C403',
               END OF c_logali,

               c_saludo TYPE c LENGTH 4 VALUE 'Hola'.

    "types lt_table type taBLE of /dmo/agency.

    TYPES: char TYPE c LENGTH 1,

           BEGIN OF ty_flights,
             travel_id   TYPE /dmo/travel_id,
             agency_id   TYPE /dmo/agency_id,
             customer_id TYPE /dmo/customer_id,
           END OF ty_flights.

* Instance
*    " Attributes
*    DATA: attr1 TYPE string.

    DATA: company TYPE string VALUE 'Logali' READ-ONLY.

    " Methods
    METHODS:
      set_attr IMPORTING
                 attr1 TYPE string,
      get_attr EXPORTING attr1 TYPE string,

      get_flights IMPORTING iv_flight       TYPE /dmo/travel_id
                            iv_agency       TYPE /dmo/agency_id OPTIONAL
                  RETURNING VALUE(rv_exist) TYPE char,

      get_flight IMPORTING iv_flight        TYPE /dmo/travel_id
                 RETURNING VALUE(rs_flight) TYPE ty_flights.



* Static
*    "Attributes
*    CLASS-DATA: attr2 TYPE string.
    " Methods
    CLASS-METHODS: set_attr2 IMPORTING iv_attr2 TYPE string,
      get_attr2 EXPORTING ev_attr2 TYPE string.

  PROTECTED SECTION.



  PRIVATE SECTION.

    " Attributes
    DATA: attr1 TYPE string.

    "Attributes
    CLASS-DATA: attr2 TYPE string.



ENDCLASS.



CLASS ZCL_02_BASICS_LOG_C403 IMPLEMENTATION.


  METHOD set_attr.
    me->attr1 = attr1.
    me->company = 'otro valor'.
  ENDMETHOD.


  METHOD set_attr2.
    attr2 = iv_attr2.
  ENDMETHOD.


  METHOD get_attr.
    attr1 = me->attr1.
  ENDMETHOD.


  METHOD get_attr2.
    ev_attr2 = attr2.
  ENDMETHOD.


  METHOD get_flights.


    IF iv_agency IS INITIAL.
      DATA(lv_agency) = iv_agency.
    ENDIF.

    IF iv_agency IS SUPPLIED.
      lv_agency = iv_agency.
    ENDIF.

    SELECT SINGLE FROM /dmo/travel
    FIELDS *
    WHERE travel_id = @iv_flight
    INTO @DATA(ls_travel).

    IF sy-subrc = 0.
      rv_exist = abap_true.
    ELSE.
      rv_exist = abap_false.
    ENDIF.

  ENDMETHOD.


  METHOD get_flight.

    SELECT SINGLE FROM /dmo/travel
     FIELDS travel_id,
            agency_id,
            customer_id
     WHERE travel_id = @iv_flight
     INTO @rs_flight.

  ENDMETHOD.
ENDCLASS.
