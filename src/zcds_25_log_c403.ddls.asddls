@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association To Parent'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_25_log_c403
  as select from /dmo/booking

  association to parent zcds_24_log_c403 as _Travel   on _Travel.TravelId = $projection.TravelId

  association [1..1] to /DMO/I_Customer         as _Customer on _Customer.CustomerID = $projection.CustomerId
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      _Travel,
      _Customer
}
