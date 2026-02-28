CLASS zcl_41_observer_log_c403 DEFINITION ABSTRACT
  PUBLIC
* FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      on_modified_state ABSTRACT
        FOR EVENT modified_state OF zcl_40_processes_log_c403
        IMPORTING ev_new_state.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_41_observer_log_c403 IMPLEMENTATION.
ENDCLASS.
