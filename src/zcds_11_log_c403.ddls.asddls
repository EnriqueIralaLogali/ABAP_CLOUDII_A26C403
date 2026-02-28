@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Associations'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_11_log_c403
  as select from /dmo/travel as Travel

  //  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = Travel.customer_id
  //  association [1..1] to /dmo/agency   as _Agency   on _Agency.agency_id = Travel.agency_id

  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId
  association [1..1] to /dmo/agency   as _Agency   on _Agency.agency_id = $projection.AgencyId

{
  key Travel.travel_id                                                 as TravelId,
      Travel.customer_id                                               as CustomerId,
      concat_with_space( _Customer.first_name, _Customer.last_name, 2) as CustomerName,
      Travel.agency_id                                                 as AgencyId,
      _Agency.name                                                     as AgencyName
}
