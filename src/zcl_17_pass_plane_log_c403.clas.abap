CLASS zcl_17_pass_plane_log_c403 DEFINITION INHERITING FROM zcl_15_airplane_log_c403
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: airplane_type REDEFINITION.
    meTHODS: discount.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_pass_plane_log_c403 IMPLEMENTATION.

  METHOD airplane_type.
    rv_airplane_type = 'Passenger Plane'.
  ENDMETHOD.

  METHOD discount.

  ENDMETHOD.

ENDCLASS.
