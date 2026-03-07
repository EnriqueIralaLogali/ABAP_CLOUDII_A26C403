@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association - Publish'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_14_log_c403
  as select from /dmo/travel as Travel

  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId
  association [1..1] to /dmo/agency   as _Agency   on _Agency.agency_id = $projection.AgencyId
  association [0..*] to /dmo/booking  as _Booking  on _Booking.travel_id = $projection.TravelId

{
  key Travel.travel_id   as TravelId,
      Travel.agency_id   as AgencyId,
      Travel.customer_id as CustomerId,
      _Customer,
      _Agency,
      _Booking
}
