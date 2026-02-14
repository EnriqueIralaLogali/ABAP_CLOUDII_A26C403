CLASS zcl_12_abstract_log_c403 DEFINITION ABSTRACT
  PUBLIC
  "FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      merchandise_output
        RETURNING VALUE(rv_merchadise) TYPE string,

      production_line ABSTRACT
        RETURNING VALUE(rv_production) TYPE string,

      input_products ABSTRACT
        RETURNING VALUE(rv_input) TYPE string.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_12_ABSTRACT_LOG_C403 IMPLEMENTATION.


  METHOD merchandise_output.
    rv_merchadise = 'Mechandise output'.
  ENDMETHOD.
ENDCLASS.
