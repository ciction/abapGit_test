@EndUserText.label: 'Bier projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_BIEROLADE_BIER
  as projection on ZI_BIEROLADE_BIER as Beer
{
  key BeerId,
      @Search.defaultSearchElement: true

      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZI_BIEROLADE_BREWERIES', element: 'Brewery'}  }]
      Brewery,
      @Search.defaultSearchElement: true
      Name,
      Style,
      Abv,
      Origin,
      Descr,
      AvgRating,

      //      @Semantics.imageUrl: true
      ImageUrl,


      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,



      /* Associations */
      _Rating : redirected to composition child ZC_BIEROLADE_RATING,
      _BREWERIES
}
