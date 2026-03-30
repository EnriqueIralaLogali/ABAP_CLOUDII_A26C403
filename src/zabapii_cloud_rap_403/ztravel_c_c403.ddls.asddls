@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Consumption entity'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZTRAVEL_C_C403
  provider contract transactional_query
  as projection on ztravel_r_c403
{
  key     TravelUuid,
          TravelId,

          // Honau er Reisen GmbH
          //
          //0.0   hon    honduras, hondo  hohon ho h
          //0.1
          //0.2
          //0.3
          //
          //....
          //      hon
          //1.0

          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          @Search.ranking: #MEDIUM
          @ObjectModel.text.element: [ 'AgencyName' ]
          AgencyId,
          _Agency.Name       as AgencyName,

          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          @Search.ranking: #MEDIUM
          @ObjectModel.text.element: [ 'CustomerName' ]
          CustomerId,
          _Customer.LastName as CustomerName,

          BeginDate,
          EndDate,

          @Semantics.amount.currencyCode: 'CurrencyCode'
          BookingFee,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          TotalPrice,

          // SADL - Service Adaptation Description Languaje
          @EndUserText.label: 'VAT Included'
          @Semantics.amount.currencyCode: 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRT_ELEM_C403'
  virtual PriceWithVat : /dmo/total_price,

          CurrencyCode,

          Description,

          @ObjectModel.text.element: [ 'OverallStatusText' ]
          OverallStatus,
          //_OverallStatus._Text[1:Language = $session.system_language].Text AS OverallStatusText,
          _OverallStatus._Text.Text as OverallStatusText : localized,

          @Semantics.systemDateTime.localInstanceLastChangedAt: true
          LocalLastChangedAt,
          @Semantics.systemDateTime.lastChangedAt: true
          LastChangedAt,

          /* Associations */
          _Agency,
          _Currency,
          _Customer,
          _OverallStatus
}
