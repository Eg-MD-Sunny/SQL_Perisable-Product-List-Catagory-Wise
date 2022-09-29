select  pv.Id [PVID],
		pv.Name [Eng Name],
		pv.NameBn [Bng Name],
		pvp.CostPrice [CostPrice],
		(case when  pvm.CategoryId in (25) then 'Meat' 
		when  pvm.CategoryId in (61) then 'Egg'
		when  pvm.CategoryId in (1235) then 'Fish'
	--	when  pvm.CategoryId in (9) and pv.name like '%Tofu%' then 'Tofu'
		else null end)[Category]

from ProductVariant pv
join ProductVariantPricing pvp on pv.Id = pvp.ProductVariantId 
join productvariantcategorymapping pvm on pvm.productvariantid=pv.id

where pv.distributionnetworkid=1
and pvp.MetropolitanAreaId = 1
and pv.Published = 1
and pv.Deleted  = 0
and pvm.CategoryId in (25,61,1235,9)


group by pv.Id,
		pv.Name,
		pv.NameBn,
		pvp.CostPrice,
		(case when  pvm.CategoryId in (25) then 'Meat' 
		when  pvm.CategoryId in (61) then 'Egg'
		when  pvm.CategoryId in (1235) then 'Fish'
		--when  pvm.CategoryId in (9) and pv.name like '%Tofu%' then 'Tofu'
		else null end)

		--(25,61,1235,9)

---Meat - 25