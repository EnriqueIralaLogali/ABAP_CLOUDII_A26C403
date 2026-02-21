CLASS zcl_35_triangule_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_06_fm_log_c403 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_35_triangule_log_c403 IMPLEMENTATION.


  METHOD zif_06_fm_log_c403~draw_figure.
    rv_shape = 'Triangule'.
  ENDMETHOD.
ENDCLASS.
