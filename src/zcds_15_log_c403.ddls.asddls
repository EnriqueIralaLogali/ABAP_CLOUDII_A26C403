@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association - Path Expressions'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_15_log_c403
  as select from zcds_14_log_c403
{
  key TravelId,
      AgencyId,
      CustomerId,
      /* Associations */
      _Agency.name
}
