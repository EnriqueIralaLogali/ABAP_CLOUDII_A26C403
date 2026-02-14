CLASS zcl_05_heritance_log_c403 DEFINITION INHERITING FROM zcl_04_heritance_log_c403
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      constructor,
      get_architecture REDEFINITION.
      "set_memory REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_05_HERITANCE_LOG_C403 IMPLEMENTATION.


  METHOD get_architecture.

    super->get_architecture( ).

    me->architecture = '32 bits'.

    super->get_architecture( ).

    rv_architecture = me->architecture.

    super->get_architecture( ).
  ENDMETHOD.


  METHOD constructor.

    super->constructor( ).

    "me->architecture = '32 bits'.

  ENDMETHOD.
ENDCLASS.
