/*
Please create a Database View (with name v_generated_dates) which should be “store” 
generated dates from 1st to 31th of January 2022 in DATE type. 
Don’t forget about order for the generated_date column.
*/

CREATE VIEW v_generated_dates AS
SELECT generated_date::date
FROM generate_series('2022-01-01'::date, '2022-01-31'::date, interval '1 day') AS generated_date
ORDER BY generated_date ASC;