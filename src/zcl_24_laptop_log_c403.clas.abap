CLASS zcl_24_laptop_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: keyboard TYPE REF TO zcl_23_keyboard_log_c403.
    METHODS:
      constructor IMPORTING io_keyboard TYPE REF TO zcl_23_keyboard_log_c403.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_laptop_log_c403 IMPLEMENTATION.

  METHOD constructor.
    me->keyboard = io_keyboard.
  ENDMETHOD.

ENDCLASS.
