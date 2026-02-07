CLASS zcl_16_cargo_plane_log_c403 DEFINITION
  PUBLIC
  INHERITING FROM zcl_15_airplane_log_c403
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: airplane_type REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_cargo_plane_log_c403 IMPLEMENTATION.

  METHOD airplane_type.
    rv_airplane_type = 'Cargo plane'.
  ENDMETHOD.

ENDCLASS.
