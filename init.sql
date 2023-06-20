USE mydatabase;
CREATE TABLE IF NOT EXISTS users (
    ID INT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    email VARCHAR(30)
);

GRANT ALL PRIVILEGES ON mydatabase.users TO 'flask'@'%';

INSERT INTO users (ID, name, age, email)
VALUES 
(1, 'Alice', 30, 'alice@example.com'),
(2, 'Bob', 35, 'bob@example.com'),
(3, 'Charlie', 25, 'charlie@example.com'),
(4, 'David', 40, 'david@example.com'),
(5, 'Eve', 28, 'eve@example.com'),
(6, 'Frank', 33, 'frank@example.com'),
(7, 'Grace', 37, 'grace@example.com'),
(8, 'Heidi', 32, 'heidi@example.com'),
(9, 'Ivan', 31, 'ivan@example.com'),
(10, 'Judy', 29, 'judy@example.com'),
(11, 'Kevin', 34, 'kevin@example.com'),
(12, 'Linda', 35, 'linda@example.com'),
(13, 'Mike', 36, 'mike@example.com'),
(14, 'Nancy', 33, 'nancy@example.com'),
(15, 'Oscar', 28, 'oscar@example.com'),
(16, 'Pam', 27, 'pam@example.com'),
(17, 'Quentin', 38, 'quentin@example.com'),
(18, 'Rita', 29, 'rita@example.com'),
(19, 'Steve', 31, 'steve@example.com'),
(20, 'Tina', 39, 'tina@example.com');






