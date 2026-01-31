CLASS zcl_02_basics_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "types lt_table type taBLE of /dmo/agency.

* Instance
*    " Attributes
*    DATA: attr1 TYPE string.

    " Methods
    METHODS: set_attr IMPORTING
                        attr1 TYPE string,
      get_attr EXPORTING attr1 TYPE string.


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



CLASS zcl_02_basics_log_c403 IMPLEMENTATION.

  METHOD set_attr.
    me->attr1 = attr1.
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

ENDCLASS.
