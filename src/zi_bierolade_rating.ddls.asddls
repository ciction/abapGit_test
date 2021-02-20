@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Rating view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BIEROLADE_RATING
  as select from zbierolade_rate as rating

  association to parent ZI_BIEROLADE_BIER as _Bier on $projection.BeerId = _Bier.BeerId
{
  key rating_id             as RatingId,
      beer_id               as BeerId,
      @EndUserText: {
      label: 'Creator' ,
      quickInfo: 'Creator'
      }
      creator               as Creator,
      @EndUserText: {
      label: 'Collar' ,
      quickInfo: 'Collar'
      }
      collar                as Collar,
      @EndUserText: {
      label: 'Opacity' ,
      quickInfo: 'Opacity'
      }
      opacity               as Opacity,
      @EndUserText: {
      label: 'Color' ,
      quickInfo: 'Color'
      }
      color                 as Color,
      @EndUserText: {
      label: 'Fruit' ,
      quickInfo: 'Fruit'
      }
      fruit                 as Fruit,
      @EndUserText: {
      label: 'Malt' ,
      quickInfo: 'Malt'
      }
      malt                  as Malt,
      @EndUserText: {
      label: 'Spice' ,
      quickInfo: 'Spice'
      }
      spice                 as Spice,
      @EndUserText: {
      label: 'Sweet' ,
      quickInfo: 'Sweet'
      }
      sweet                 as Sweet,
      @EndUserText: {
      label: 'Bitter' ,
      quickInfo: 'Bitter'
      }
      bitter                as Bitter,
      @EndUserText: {
      label: 'Sour' ,
      quickInfo: 'Sour'
      }
      sour                  as Sour,
      @EndUserText: {
      label: 'Body' ,
      quickInfo: 'Body'
      }
      body                  as Body,
      @EndUserText: {
      label: 'Acidity' ,
      quickInfo: 'Acidity'
      }
      acidity               as Acidity,
      @EndUserText: {
      label: 'Rating' ,
      quickInfo: 'Rating'
      }
      rating                as Rating,



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
      _Bier
}
