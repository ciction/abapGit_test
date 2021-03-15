@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bier view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_BIEROLADE_BIER
  as select from zbierolade_beer as beer

  composition [0..*] of ZI_BIEROLADE_RATING    as _Rating

  association [0..1] to ZI_BIEROLADE_BREWERIES as _BREWERIES on $projection.Brewery = _BREWERIES.Brewery
{
  key beer_id               as BeerId,
      @EndUserText: {
      label: 'Brewery' ,
      quickInfo: 'Brewery'
      }
      brewery               as Brewery,
      @EndUserText: {
      label: 'Name' ,
      quickInfo: 'Name'
      }
      name                  as Name,
      @EndUserText: {
      label: 'Style' ,
      quickInfo: 'Style'
      }
      style                 as Style,
      @EndUserText: {
      label: 'Abv' ,
      quickInfo: 'Abv'
      }
      abv                   as Abv,
      @EndUserText: {
      label: 'Origin' ,
      quickInfo: 'Origin'
      }
      origin                as Origin,
      @EndUserText: {
      label: 'Status' ,
      quickInfo: 'Status'
      }
      status                as Status,
      @EndUserText: {
      label: 'Descr' ,
      quickInfo: 'Descr'
      }
      descr                 as Descr,
      @EndUserText: {
      label: 'AvgRating' ,
      quickInfo: 'AvgRating'
      }
      avg_rating            as AvgRating,
      @EndUserText: {
      label: 'ImageUrl' ,
      quickInfo: 'ImageUrl'
      }
      image_url             as ImageUrl,

      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      /*associations*/
      _Rating,
      _BREWERIES
}
