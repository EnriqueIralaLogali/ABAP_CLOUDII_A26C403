@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_09_log_c403
  as select from /dmo/travel  as Travel

    inner join   /dmo/booking as Booking

    on Booking.travel_id = Travel.travel_id

{
  key Travel.travel_id                              as TravelId,
  key Booking.booking_id                            as BookingId,
      Travel.agency_id                              as AgencyId,
      Travel.begin_date                             as BeginDate,
      Travel.end_date                               as EndDate,
      Booking.booking_date                          as BookingDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(Travel.total_price as abap.dec( 16, 2 )) as TotalPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price                          as BookingPrice,
      Booking.currency_code                         as CurrencyCode
}

where
  Travel.begin_date > $session.system_date
