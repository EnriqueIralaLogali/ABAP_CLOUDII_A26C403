CLASS zcl_31_manage_cntrl_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: check_user IMPORTING iv_user TYPE syuname
                        RAISING   zcx_01_auth_log_c403.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_31_manage_cntrl_log_c403 IMPLEMENTATION.

  METHOD check_user.

    IF sy-uname = 'xxxxxxx'.

      RAISE EXCEPTION TYPE zcx_01_auth_log_c403
*       EXPORTING
*         textid   =
*         previous =
*         msgv1    =
*         msgv2    =
*         msgv3    =
*         msgv4    =
        .

    ENDIF.

  ENDMETHOD.

ENDCLASS.
