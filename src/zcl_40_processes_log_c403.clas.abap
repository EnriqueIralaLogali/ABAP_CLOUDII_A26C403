CLASS zcl_40_processes_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      set_state IMPORTING iv_state TYPE string,
      get_state RETURNING VALUE(rv_state) TYPE string.

    EVENTS modified_state EXPORTING VALUE(ev_new_state) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: current_state TYPE string.

ENDCLASS.



CLASS zcl_40_processes_log_c403 IMPLEMENTATION.

  METHOD get_state.
    rv_state = me->current_state.
  ENDMETHOD.

  METHOD set_state.
    me->current_state = iv_state.
    RAISE EVENT modified_state EXPORTING ev_new_state = me->current_state.
  ENDMETHOD.

ENDCLASS.
