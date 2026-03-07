CLASS zcl_path_expressions_log_c403 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_path_expressions_log_c403 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zcds_19_log_c403 AS Booking
    FIELDS booking~TravelId,
           booking~BookingId,
           \_Travel-AgencyId,
           \_Travel\_Agency-name AS AgencyName,
           \_Travel-CustomerId,
           concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 2 ) AS CustomerName
           WHERE booking~CarrierId = 'AA'
            AND \_travel-AgencyId = '070049'
            INTO TABLE @DATA(lt_results)
            UP TO  5 ROWS.

    IF sy-subrc = 0.

      out->write( lt_results ).

    ENDIF.



















  ENDMETHOD.

ENDCLASS.
