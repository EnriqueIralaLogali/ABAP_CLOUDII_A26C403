@EndUserText.label: 'Table function'
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE
define table function ztf_01_log_c403
  with parameters
    pCountryCode : abap.char( 3 )
returns
{
  key Client        : abap.clnt;
  key TravelId      : /dmo/travel_id;
  key booking_id    : /dmo/booking_id;
  key customer_id   : /dmo/customer_id;
      first_name    : /dmo/first_name;
      last_name     : /dmo/last_name;
      booking_date  : /dmo/booking_date;
      carrier_id    : /dmo/carrier_id;
      connection_id : /dmo/connection_id;
      flight_date   : /dmo/flight_date;
      @Semantics.amount.currencyCode : 'currency_code'
      flight_price  : /dmo/flight_price;
      currency_code : /dmo/currency_code;
}
implemented by method
  zcl_amdp_tf_c403=>get_cust_bookings;