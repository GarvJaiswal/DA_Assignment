SELECT top(12)
		tt.user_id,
		MAX(tt.amount-tt.discount) AS total_spend,
		MAX(tt.amount) AS total_bill,
		COUNT(tt.visit_rank) AS total_visits,
		MIN(tt.txn_date) AS first_transaction_date,
		MAX(tl.bill_date) AS last_transaction_date,
		tt.store_name AS first_transaction_store,
		tt.store_name AS last_transaction_store,
		tt.store_name AS fav_store,
		SUM(tl.qty) AS total_quantity_purchased
FROM transaction_log_loyalty as tt
inner join transaction_log_loyalty_lineitem as tl
on tt.user_id=tl.user_id
group by tt.user_id, 
		tt.store_name
order by tt.user_id ASC;


