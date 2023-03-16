@EndUserText.label: 'Consumption - Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity Z_C_ITEMS_U2985
  as projection on ZI_ITEMS_U2985
{
  key Id               as Id,
      Name             as Name,
      Description      as Description,
      ReleaseDate      as ReleaseDate,
      DiscontinuedDate as DiscontinuedDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price            as Price,
      @Semantics.currencyCode: true
      CurrencyCode     as CurrencyCode,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Height           as Height,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Width            as Width,
      Depth            as Depth,
      Quantity         as Quantity,
      UnitOfMeasure    as UnitOfMeasure,
      LastChangedAt    as LastChangedAt,

      /* Associations */
      _Header : redirected to parent Z_C_HEADER_U2985
}
