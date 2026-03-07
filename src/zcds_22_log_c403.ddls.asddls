@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS For Hierarchy'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_22_log_c403
  as select from zemployee_lgl

//  association [0..1] to zemployee_lgl as _Manager on _Manager.employee = $projection.Manager
  association [0..1] to zcds_22_log_c403 as _Manager on _Manager.Employee = $projection.Manager

{
  key employee as Employee,
      manager  as Manager,
      name     as Name,
      _Manager
}
