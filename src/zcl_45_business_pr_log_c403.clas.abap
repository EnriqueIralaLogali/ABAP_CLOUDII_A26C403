CLASS zcl_45_business_pr_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      get_factorial IMPORTING iv_number    TYPE i
                    EXPORTING ev_factorial TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_45_business_pr_log_c403 IMPLEMENTATION.

  METHOD get_factorial.

    CHECK iv_number GT 0.

    DATA(lv_number) = iv_number.

    ev_factorial = 1.

* Factorial of 4 = 1x2x3x4 = 24
    WHILE lv_number NE 0.
      ev_factorial = ev_factorial * lv_number.
      lv_number -= 1.
    ENDWHILE.


  ENDMETHOD.

ENDCLASS.
