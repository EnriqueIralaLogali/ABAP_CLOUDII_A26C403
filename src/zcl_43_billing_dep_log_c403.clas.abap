CLASS zcl_43_billing_dep_log_c403 DEFINITION INHERITING FROM zcl_41_observer_log_c403
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: state TYPE string.
    METHODS: on_modified_state REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_43_billing_dep_log_c403 IMPLEMENTATION.

  METHOD on_modified_state.
    me->state = ev_new_state.
  ENDMETHOD.

ENDCLASS.
