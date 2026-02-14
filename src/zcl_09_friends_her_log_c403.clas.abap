CLASS zcl_09_friends_her_log_c403 DEFINITION
  PUBLIC
  "FINAL
  CREATE PRIVATE. "PROTECTED. "PUBLIC .

  PUBLIC SECTION.

    METHODS get_friend_data.

  PROTECTED SECTION.

    DATA: my_attr TYPE string.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_09_FRIENDS_HER_LOG_C403 IMPLEMENTATION.


  METHOD get_friend_data.

    DATA(lo_encap) = NEW zcl_09_friends_her_log_c403( ).

    DATA(lo_friend) = NEW zcl_08_friends_log_c403( ).

    lo_friend->warehouse = 'Main Warehouse'.

  ENDMETHOD.
ENDCLASS.
