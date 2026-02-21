CLASS zcl_36_factory_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      get_shape
        IMPORTING iv_shape_type   TYPE string
        RETURNING VALUE(ro_shape) TYPE REF TO zif_06_fm_log_c403.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_36_factory_log_c403 IMPLEMENTATION.

  METHOD get_shape.

    CASE iv_shape_type.
      WHEN 'Circle'.
        ro_shape = NEW zcl_33_circle_log_c403( ).
      WHEN 'Square'.
        ro_shape = NEW zcl_34_square_log_c403( ).
      WHEN 'Triangule'.
        ro_shape = NEW zcl_35_triangule_log_c403( ).
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
