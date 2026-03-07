@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association with parameters'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_13_log_c403

  with parameters
    pCountryCode : land1

  as select from /dmo/travel as Travel

  association [1..1] to zcds_12_log_c403 as _Agency on _Agency.AgencyId = $projection.AgencyId

{
  key Travel.travel_id                                       as TravelId,
      Travel.agency_id                                       as AgencyId,
      _Agency( pCountryCode: $parameters.pCountryCode )[City = 'Berlin'].Name as AgencyName

}
