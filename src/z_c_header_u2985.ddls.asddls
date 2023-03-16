@EndUserText.label: 'Consumption - Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity Z_C_HEADER_U2985
  as projection on ZI_HEADER_U2985
{
  key Id            as Id,
      Email         as Email,
      FirstName     as FirstName,
      LastName      as LastName,
      Country       as Country,
      CreateOn      as CreateOn,
      DeliveryDate  as DeliveryDate,
      OrderStatus   as Status,
      ImageUrl      as ImageUrl,
      LastChangedAt as LastChangedAt,

      /* Associations */
      _Items : redirected to composition child Z_C_ITEMS_U2985
}
