--select * from tb_sot_orders_flat limit 10;
select
	salesperson,
	SUM(totaldue) VALOR_TOTAL,
	COUNT(1) TOTAL_vendas
from
(
	SELECT distinct salesperson, salesorderid, totaldue from tb_sot_orders_flat
) aux
GROUP BY
	salesperson