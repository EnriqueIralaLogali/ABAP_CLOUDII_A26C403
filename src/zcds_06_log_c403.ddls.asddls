@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Type Conversion'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_06_log_c403
  as select from /dmo/travel
{
  key travel_id,
      agency_id,
      cast( total_price as abap.dec(16,2)) as total_price,
      currency_code
}
