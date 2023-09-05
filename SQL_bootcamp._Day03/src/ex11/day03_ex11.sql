/*
Please change the price for “greek pizza” on -10% from the current value.
*/

UPDATE menu SET price = price - (price * 0.1)
WHERE pizza_name = 'greek pizza';