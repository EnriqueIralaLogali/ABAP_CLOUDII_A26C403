@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consume Scalar Function'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_38_LOG_C403
  as select from /dmo/carrier
{
  key carrier_id                                        as CarrierId,
      name                                              as Name,
      currency_code                                     as CurrencyCode,
      zsf_vat_by_airline_c403( pAirline => carrier_id ) as VAT

}
