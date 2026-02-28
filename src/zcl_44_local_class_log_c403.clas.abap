CLASS zcl_44_local_class_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: my_meth.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: t_first TYPE ty_first.

ENDCLASS.



CLASS zcl_44_local_class_log_c403 IMPLEMENTATION.

  METHOD my_meth.
    DATA(lo_local) = NEW lcl_helper( ).

  ENDMETHOD.

ENDCLASS.
