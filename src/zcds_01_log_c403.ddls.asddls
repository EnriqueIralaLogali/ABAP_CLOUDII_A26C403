@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Basics'
@Metadata.ignorePropagatedAnnotations: true

//@ObjectModel.semanticKey: [ 'CarrierId', 'ConnectionId', 'FlightDate' ]

define view entity zcds_01_log_c403
  as select from /dmo/flight
{
  key carrier_id                                                  as AirlineID,
  key connection_id                                               as ConnectionID,
  key flight_date                                                 as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Price'
      price                                                       as Price,
      currency_code                                               as CurrencyCode,

      'USD'                                                       as CurrencyDocument,

      '20260221'                                                  as DateString,

      cast( '20260221' as abap.dats )                             as DateDate,

      1.2                                                         as FloatPoint,

      fltp_to_dec( 1.2 as abap.dec( 4, 2 ) )                      as DecimalElement,

      cast( cast( 'E' as abap.lang ) as sylangu preserving type ) as LaguajeElement

}
