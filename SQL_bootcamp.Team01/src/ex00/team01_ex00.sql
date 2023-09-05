WITH currency_id_table AS (
  SELECT id,
    MAX(updated) AS date
  FROM currency
  GROUP BY id
),
currency_table AS (
  SELECT currency.id,
    currency.rate_to_usd,
         currency.name AS currency_name
  FROM currency_id_table
JOIN currency ON currency.updated = currency_id_table.date
    AND currency.id = currency_id_table.id
), user_table AS (
        SELECT COALESCE("user".name, 'not defined') AS name,
      COALESCE("user".lastname, 'not defined') AS lastname,
      balance.type,
      SUM(balance.money) AS volume,
      balance.currency_id
    FROM "user"
    FULL JOIN balance ON balance.user_id = "user".id
    GROUP BY "user".name,
      "user".lastname,
      "user".name,
      balance.type,
      balance.currency_id
),
firstPart AS (SELECT name,
       lastname,
       type,
       volume,
       COALESCE(currency_name, 'not defined') AS currency_name,
       COALESCE(rate_to_usd, 1) AS rate_to_usd
FROM user_table
FULL JOIN currency_table
ON user_table.currency_id = currency_table.id)

SELECT * , firstPart.volume * firstPart.rate_to_usd AS total_volume_in_usd FROM firstPart
ORDER BY firstPart.name DESC , firstPart.lastname, firstPart.type;



