@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Contract type Int. Child'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_27_LOG_C403
  as projection on zcds_25_log_c403
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      /* Associations */
      _Customer,
      _Travel: redirected to parent ZCDS_26_LOG_C403
}
