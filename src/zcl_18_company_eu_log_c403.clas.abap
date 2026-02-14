CLASS zcl_18_company_eu_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_04_log_c403.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_18_company_eu_log_c403 IMPLEMENTATION.

  METHOD zif_04_log_c403~define_company.
    rv_company = 'Company Europe....'.
  ENDMETHOD.

ENDCLASS.
