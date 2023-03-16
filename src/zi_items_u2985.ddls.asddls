@AbapCatalog.sqlViewName: 'ZV_ITEMS_2985'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interface - Items'
define view ZI_ITEMS_U2985 
  as select from zitems_u2985 as Items
  association        to parent ZI_HEADER_U2985 as _Header   on $projection.Id = _Header.Id
  association [0..1] to I_Currency              as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key id               as Id,
      name             as Name,
      description      as Description,
      releasedate      as ReleaseDate,
      discontinueddate as DiscontinuedDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price            as Price,
      currency_code    as CurrencyCode,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      height           as Height,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      width            as Width,
      depth            as Depth,
      quantity         as Quantity,
      unitofmeasure    as UnitOfMeasure,
      last_changed_at  as LastChangedAt,
      _Header,
      _Currency
}
