select  pv.Id [PVID],
		pv.Name [Eng Name],
		pv.NameBn [Bng Name],
		pvp.CostPrice [CostPrice],
		'Tofu' [Category]

from ProductVariant pv
join ProductVariantPricing pvp on pv.Id = pvp.ProductVariantId 
join productvariantcategorymapping pvm on pvm.productvariantid=pv.id

where pv.distributionnetworkid=1
and pvp.MetropolitanAreaId = 1
and pv.Published = 1
and pv.Deleted  = 0
and pvm.CategoryId in (9)
and pv.name like '%tofu%'


group by pv.Id,
		pv.Name,
		pv.NameBn,
		pvp.CostPrice
