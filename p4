PRACTICAL 4 — DCL & TCL: Banking System with Transactions
```sql
-- Create Table
CREATE TABLE Accounts (
acc_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
balance DECIMAL(12,2) NOT NULL
);
-- Insert Records
INSERT INTO Accounts VALUES
(1, 'Amit Shah', 10000.00),
(2, 'Priya Patil', 25000.00),
(3, 'Ravi Kumar', 15000.00),
(4, 'Sneha Joshi', 30000.00),
(5, 'Neha Gupta', 20000.00);
-- TCL: Money Transfer using Transaction
START TRANSACTION;
SAVEPOINT before_transfer;
UPDATE Accounts SET balance = balance - 5000 WHERE acc_id = 1;
UPDATE Accounts SET balance = balance + 5000 WHERE acc_id = 2;
-- If everything is fine:
COMMIT;
-- To undo till savepoint (if needed):
-- ROLLBACK TO before_transfer;
-- DCL: Grant and Revoke (run as admin/root)
CREATE USER 'bank_user'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON Accounts TO 'bank_user'@'localhost';
REVOKE UPDATE ON Accounts FROM 'bank_user'@'localhost';
