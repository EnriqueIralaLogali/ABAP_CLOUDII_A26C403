@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Amount Conversion'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_07_log_c403
  with parameters
    pFromCurrency : abap.cuky,
    pToCurrency   : abap.cuky


  as select from /dmo/travel
{
  key travel_id                                               as TravelID,

      @Semantics.amount.currencyCode: 'OriginalCurrency'
      total_price                                             as OriginalPrice,
      currency_code                                           as OriginalCurrency,

      @Semantics.amount.currencyCode: 'CovertedCurrency'
      currency_conversion( amount => total_price,
                           source_currency => $parameters.pFromCurrency,
                           target_currency => $parameters.pToCurrency,
                           exchange_rate_date => begin_date,
                           client => $session.client,
                           error_handling => 'SET_TO_NULL'  ) as CovertedPrice,
      //      error_handling => 'FAIL_ON_ERROR'  ) as CovertedPrice,

      $parameters.pToCurrency                                 as CovertedCurrency
}
where
  currency_code = $parameters.pFromCurrency
