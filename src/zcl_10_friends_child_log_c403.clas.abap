CLASS zcl_10_friends_child_log_c403 DEFINITION INHERITING FROM zcl_09_friends_her_log_c403
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_private_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_10_FRIENDS_CHILD_LOG_C403 IMPLEMENTATION.


  METHOD get_private_data.

   data(lo_encap) = new zcl_09_friends_her_log_c403( ).

   lo_encap->get_friend_data( ).

   me->my_attr = 'attr_child'.

   data(lo_friend) = new zcl_08_friends_log_c403( ).

   lo_friend->warehouse = 'Child Warehouse'.

  ENDMETHOD.
ENDCLASS.
