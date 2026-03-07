CLASS zcl_query_prov_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_query_prov_log_c403 IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

    DATA: lt_results TYPE TABLE OF zcds_20_log_c403.

    TRY.

        IF io_request->is_data_requested( ).

          DATA(lv_top) = io_request->get_paging( )->get_page_size( ).
          DATA(lv_skip) = io_request->get_paging( )->get_offset( ).

          SELECT FROM /dmo/travel
          FIELDS travel_id,
                 agency_id,
                 customer_id
           ORDER BY travel_id ASCENDING
            INTO TABLE @lt_results
          OFFSET @lv_skip
           UP TO @lv_top ROWS.

          IF sy-subrc = 0.

            io_response->set_total_number_of_records( lines( lt_results ) ).
            io_response->set_data( lt_results ).

          ENDIF.

        ENDIF.

      CATCH cx_rap_query_response_set_twic INTO DATA(lx_exc).

    ENDTRY.

  ENDMETHOD.

ENDCLASS.
