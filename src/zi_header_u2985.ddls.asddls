@AbapCatalog.sqlViewName: 'ZV_HEADER_2985'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface - Header'
define root view ZI_HEADER_U2985
  as select from zheader_u2985 as Header
  composition [0..1] of ZI_ITEMS_U2985 as _Items

{
  key id              as Id,
      email           as Email,
      firstname       as FirstName,
      lastname        as LastName,
      country         as Country,
      createon        as CreateOn,
      deliverydate    as DeliveryDate,
      orderstatus     as OrderStatus,
      imageurl        as ImageUrl,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Items
}
