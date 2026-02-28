@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregations'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_05_log_c403
  as select from zcds_06_log_c403
{
//  key travel_id                            as TravelID,
//      agency_id                            as AgencyID,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      min( total_price )                   as MinTotalPrice,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      max( total_price )                   as MaxTotalPrice,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum( total_price )                   as SumTotalPrice,

      count( distinct total_price )        as CountDistTotalPrice,

      count( * )                           as CountAllTotalPrice,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      avg( total_price as abap.dec(16, 2)) as AvgTotalPrice,

      currency_code                        as CurrencyCode
}
group by
//  travel_id,
//  agency_id,
  currency_code;
