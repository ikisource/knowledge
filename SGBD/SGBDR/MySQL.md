# Show the size of database
replace <database_name> by the name of your database
```
SELECT table_name AS "Table",
       round(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
FROM information_schema.tables
WHERE table_schema = 'demo'
ORDER BY (data_length + index_length) DESC;
```
