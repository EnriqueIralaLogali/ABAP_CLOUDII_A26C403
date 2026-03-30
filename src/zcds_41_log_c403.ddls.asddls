@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION

define view entity ZCDS_41_LOG_C403
  as select from I_Currency
  
  association [0..*] to I_CurrencyText as _Text on _Text.Currency = $projection.Currency 
  
{
    key Currency,
    
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    @Search.fuzzinessThreshold: 0.8
    CurrencyISOCode,
    AlternativeCurrencyKey,
    IsPrimaryCurrencyForISOCrcy,
    
    /* Associations */
    _Text
  }
