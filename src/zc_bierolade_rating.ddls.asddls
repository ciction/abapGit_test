@EndUserText.label: 'Rating Projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_BIEROLADE_RATING
  as projection on ZI_BIEROLADE_RATING as Rating
{
  key RatingId,
      BeerId,
      @Search.defaultSearchElement: true
      Creator,
      Collar,
      Opacity,
      Color,
      Fruit,
      Malt,
      Spice,
      Sweet,
      Bitter,
      Sour,
      Body,
      Acidity,
      Rating,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,


      /* Associations */
      _Bier : redirected to parent ZC_BIEROLADE_BIER
}
