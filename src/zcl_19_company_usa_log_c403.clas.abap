CLASS zcl_19_company_usa_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_04_log_c403 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_company_usa_log_c403 IMPLEMENTATION.


  METHOD zif_04_log_c403~define_company.
    rv_company = 'Company USA....'.
  ENDMETHOD.
ENDCLASS.
