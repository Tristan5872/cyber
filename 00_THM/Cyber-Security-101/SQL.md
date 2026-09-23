# Database

## Generalities

**`rationnal database`** : Database that stores data in a structured way, using tables, rows, and columns. 
**`non-relational database`** : Database that stores data in a non-structured way, using documents, key-value pairs, or graphs.
**`Database management system (DBMS)`** : Software that allows users to create, manage, and interact with databases. (ex: MySQL, PostgreSQL, etc)

## SQL

### Useful commands
| Command | Description |
| --- | --- |
| `USE database_name;` | Selects the database to use |
| `CREATE DATABASE database_name;` | Creates a new database |
| `DROP DATABASE database_name;` | Deletes a database |
| `CREATE TABLE table_name (column1 datatype, column2 datatype, ...);` | Creates a new table with specified columns and data types |
| `DROP TABLE table_name;` | Deletes a table |
| `SHOW TABLES;` | Lists all tables in the current database |
| `DESCRIBE table_name;` | Shows the structure of a table, including column names and data types |
| `INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);` | Inserts a new row into a table |
| `SELECT column1, column2, ... FROM table_name;` | Retrieves data from a table |
| `UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;` | Updates existing rows in a table based on a condition |
| `DELETE FROM table_name WHERE condition;` | Deletes rows from a table based on a condition |

### Clauses
A clause is a part of a SQL statement that performs a specific function.
**`WHERE`** : Filters records based on a specified condition.
Example: `SELECT * FROM table_name WHERE column1 = 'value';`
Result :
| column1 | column2 | column3 |
| --- | --- | --- |
| value | value | value |

**`GROUP BY`** : Groups rows that have the same values in specified columns.
Example: `SELECT column1, COUNT(*) FROM table_name GROUP BY column1;`
Result :
| column1 | COUNT(*) |
| --- | --- |
| value | 3 |

**`ORDER BY`** : Sorts the result set in ascending or descending order based on one or more columns.
Example: `SELECT * FROM table_name ORDER BY date_column ASC;`
*ASC* means ascending, *DESC* means descending.
Result :
| column1 | column2 | date_column |
| --- | --- | --- |
| value | value | 2021-01-01 |
| value | value | 2021-02-01 |

**`HAVING`** : Filters the results of a query based on a condition. It is used with other clauses like `GROUP BY` to filter the grouped results.
Example: `SELECT column1, COUNT(*) FROM table_name GROUP BY column1 HAVING COUNT(*) > 1;`
Result :
| column1 | COUNT(*) |
| --- | --- |
| value | 3 |
| value | 2 |
| value | 5 |

### Functions

**`COUNT()`** : Returns the number of rows in a result set.
Example: `SELECT COUNT(*) AS count_value FROM table_name;`
Result :
| count_value |
| --- |
| 10 |

**`SUM()`** : Returns the sum of the values in a column.
Example: `SELECT SUM(column1) AS sum_value FROM table_name;`
Result :
| sum_value |
| --- |
| 100 |

**`MIN()`** : Returns the smallest value in a column.
*`MAX()`* : Returns the largest value in a column.
Example: `SELECT MIN(column1) AS min_value, MAX(column1) AS max_value FROM table_name;`
Result :
| min_value | max_value |
| --- | --- |
| 1 | 10 |

**`CONCAT()`** : Combines two or more strings into one string.
Example: `SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM table_name;`
Result :
| full_name |
| --- |
| John Smith |

**`GROUP_CONCAT()`** : Combines the values of a column into a single string, separated by a delimiter.
Example: `SELECT GROUP_CONCAT(column1 SEPARATOR ', ') AS concatenated_values FROM table_name;`
Result :
| concatenated_values |
| --- |
| value1, value2, value3 |

**`SUBSTRING()`** : Extracts a portion of a string.
Example: `SELECT SUBSTRING(column1, 1, 3) AS extracted_string FROM table_name;`
Result :
| extracted_string |
| --- |
| val |

**`LENGTH()`** : Returns the length of a string.
Example: `SELECT LENGTH(column1) AS string_length FROM table_name;`
Result :
| string_length |
| --- |
| 5 |