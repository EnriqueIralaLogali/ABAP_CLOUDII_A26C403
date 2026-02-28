@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_04_log_c403
  as select from /dmo/travel
{
  key travel_id                  as TravelId,
      cast('' as abap.numc( 4 )) as BookingId
}

union all

select distinct from /dmo/booking
{
  key travel_id  as TravelId,
      booking_id as BookingId
}
