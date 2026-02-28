CLASS zcl_46_test_class_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  DURATION SHORT " medium long
  RISK LEVEL HARMLESS " dangerous critical
  .

  PUBLIC SECTION.

    METHODS:
      "! @testing zcl_45_business_pr_log_c403
      factorial_test FOR TESTING.

  PROTECTED SECTION.
  PRIVATE SECTION.
*    class-METHODS:
*      class_setup,
*      class_teardown.

    METHODS:
      setup,
      teardown.

    DATA: mo_cut TYPE REF TO zcl_45_business_pr_log_c403. " CUT Class under test

ENDCLASS.



CLASS zcl_46_test_class_log_c403 IMPLEMENTATION.

  METHOD factorial_test.

    "Given
    data(lv_number_ut) = 4.
    data lv_factorial_ut type i.

    "When
    mo_cut->get_factorial(
      EXPORTING
        iv_number    = lv_number_ut
      IMPORTING
        ev_factorial = lv_factorial_ut ).

    "Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_factorial_ut
        exp                  = 24 ).

  ENDMETHOD.

  METHOD setup.
    mo_cut = new #( ).
  ENDMETHOD.

  METHOD teardown.
    clear: mo_cut.
  ENDMETHOD.

ENDCLASS.
