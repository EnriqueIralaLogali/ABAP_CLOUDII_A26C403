CLASS zcl_32_singleton_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    DATA: time TYPE zsyst_uzeit.

    METHODS: constructor.

    CLASS-METHODS:
      get_instance
        RETURNING VALUE(ro_instance) TYPE REF TO zcl_32_singleton_log_c403.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA: instance TYPE REF TO zcl_32_singleton_log_c403.

ENDCLASS.



CLASS zcl_32_singleton_log_c403 IMPLEMENTATION.

  METHOD get_instance.

    IF instance IS NOT BOUND.
      instance = NEW #( ).
    ENDIF.

    ro_instance = instance.

  ENDMETHOD.

  METHOD constructor.
    me->time = cl_abap_context_info=>get_system_time( ).
  ENDMETHOD.

ENDCLASS.
