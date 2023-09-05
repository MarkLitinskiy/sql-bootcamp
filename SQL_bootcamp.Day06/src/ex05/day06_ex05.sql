/*
To satisfy Data Governance Policies need to add comments for the table and table's columns. 
Let’s apply this policy for the `person_discounts` table. 
Please add English or Russian comments (it's up to you) that explain what is a business goal of a table and all included attributes. 
*/

COMMENT ON TABLE person_discounts IS 'The table reflects the discount
for people in restaurants,
depending on how often they visit it';
COMMENT ON COLUMN person_discounts.id IS 'The Ordinal number of the stroke in the table';
COMMENT ON COLUMN person_discounts.person_id IS 'The serial number of the person in the table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The serial number of the pizzeria in the table';
COMMENT ON COLUMN person_discounts.discount IS 'The size of a person discount in a restaurant';