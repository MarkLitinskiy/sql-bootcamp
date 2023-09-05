INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH t1 AS (
	SElECT balance.user_id, currency.id, balance.type, currency.name, balance.updated, MAX(currency.updated) FROM  balance
	JOIN currency ON balance.currency_id = currency.id
	WHERE currency.updated <= balance.updated
	GROUP BY balance.user_id, currency.id, balance.type, currency.name, balance.updated
), t2 AS (
	SELECT balance.user_id, currency.id, balance.type, currency.name, balance.updated, MIN(currency.updated) FROM balance
	JOIN currency ON balance.currency_id = currency.id
	WHERE currency.updated > balance.updated
	GROUP BY balance.user_id, currency.id, balance.type, currency.name, balance.updated
)
SELECT COALESCE("user".name, 'not defined') AS name,
	   COALESCE("user".lastname, 'not defined') AS lastname,
	   COALESCE(t1.name, t2.name) AS currency_name,
	   balance.money * currency.rate_to_usd AS currency_in_usd
FROM t1
FULL JOIN t2 ON t1.user_id = t2.user_id AND t1.id = t2.id AND t1.updated = t2.updated
FULL JOIN "user" ON COALESCE(t1.user_id, t2.user_id) = "user".id
JOIN currency ON COALESCE(t1.id, t2.id) = currency.id AND COALESCE(t1.max, t2.min) = currency.updated
JOIN balance ON COALESCE(t1.user_id, t2.user_id) = balance.user_id 
				AND COALESCE(t1.updated, t2.updated) = balance.updated
				AND COALESCE(t1.type, t2.type) = balance.type
WHERE t1.name IS NOT NULL OR t2.name IS NOT NULL
ORDER BY name DESC, lastname, currency_name;