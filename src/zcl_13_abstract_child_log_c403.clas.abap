CLASS zcl_13_abstract_child_log_c403 DEFINITION ABSTRACT
  INHERITING FROM zcl_12_abstract_log_c403
  PUBLIC
  "FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: production_line reDEFINITION,
      input_products REDEFINITION,
      abstract_method ABSTRACT.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_abstract_child_log_c403 IMPLEMENTATION.

  METHOD input_products.
    rv_input = 'input products'.
  ENDMETHOD.

  METHOD production_line.
    rv_production = 'Production line'.
  ENDMETHOD.

ENDCLASS.
