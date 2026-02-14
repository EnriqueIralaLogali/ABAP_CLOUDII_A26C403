CLASS zcl_03_instances_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: log TYPE string.

    METHODS:
      constructor.

    CLASS-METHODS:
      class_constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_03_INSTANCES_LOG_C403 IMPLEMENTATION.


  METHOD class_constructor.
    log = |{ log } static constructor -->|.
  ENDMETHOD.


  METHOD constructor.
    log = |{ log } instance constructor -->|.
  ENDMETHOD.
ENDCLASS.
