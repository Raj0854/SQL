-- 𝙒𝙧𝙞𝙩𝙚 𝙖 𝙎𝙌𝙇 𝙦𝙪𝙚𝙧𝙮 𝙩𝙤 𝙛𝙞𝙣𝙙 𝙩𝙝𝙚 𝙖𝙫𝙚𝙧𝙖𝙜𝙚 𝙩𝙧𝙖𝙣𝙨𝙖𝙘𝙩𝙞𝙤𝙣 𝙖𝙢𝙤𝙪𝙣𝙩 𝙛𝙤𝙧 𝙚𝙖𝙘𝙝 𝙖𝙘𝙘𝙤𝙪𝙣𝙩,
--  𝙗𝙪𝙩 𝙤𝙣𝙡𝙮 𝙛𝙤𝙧 𝙩𝙝𝙤𝙨𝙚 𝙖𝙘𝙘𝙤𝙪𝙣𝙩𝙨 𝙬𝙝𝙚𝙧𝙚 𝙩𝙝𝙚 𝙖𝙫𝙚𝙧𝙖𝙜𝙚 𝙩𝙧𝙖𝙣𝙨𝙖𝙘𝙩𝙞𝙤𝙣 𝙖𝙢𝙤𝙪𝙣𝙩 
-- 𝙚𝙭𝙘𝙚𝙚𝙙𝙨 𝙩𝙝𝙚 𝙤𝙫𝙚𝙧𝙖𝙡𝙡 𝙖𝙫𝙚𝙧𝙖𝙜𝙚 𝙩𝙧𝙖𝙣𝙨𝙖𝙘𝙩𝙞𝙤𝙣 𝙖𝙢𝙤𝙪𝙣𝙩 𝙖𝙘𝙧𝙤𝙨𝙨 𝙖𝙡𝙡 𝙖𝙘𝙘𝙤𝙪𝙣𝙩𝙨.
-- 𝘼𝙡𝙨𝙤, 𝙞𝙣𝙘𝙡𝙪𝙙𝙚 𝙩𝙝𝙚 𝙖𝙘𝙘𝙤𝙪𝙣𝙩 𝙣𝙖𝙢𝙚 𝙞𝙣 𝙩𝙝𝙚 𝙧𝙚𝙨𝙪𝙡𝙩 𝙨𝙚𝙩.

-- ====================================================
CREATE DATABASE IF NOT exists BANK;
USE BANK;
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountName VARCHAR(100)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    Amount DECIMAL(10,2),
    TransactionDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
-- ====================================================
INSERT INTO Accounts (AccountID, AccountName) VALUES
(1, 'Savings Account'),
(2, 'Current Account'),
(3, 'Business Account'),
(4, 'Salary Account');
-- ====================================================
INSERT INTO Transactions (TransactionID, AccountID, Amount, TransactionDate) VALUES
(101, 1, 500.00, '2024-01-01'),
(102, 1, 700.00, '2024-01-05'),
(103, 1, 600.00, '2024-01-10'),
(104, 2, 200.00, '2024-01-02'),
(105, 2, 300.00, '2024-01-06'),
(106, 3, 1000.00, '2024-01-03'),
(107, 3, 1200.00, '2024-01-07'),
(108, 3, 1100.00, '2024-01-12'),
(109, 4, 400.00, '2024-01-04'),
(110, 4, 450.00, '2024-01-08');
-- ====================================================
SELECT 
    a.AccountID,
    a.AccountName,
    AVG(t.Amount) AS AvgTransactionAmount
FROM Accounts a
JOIN Transactions t 
    ON a.AccountID = t.AccountID
GROUP BY a.AccountID, a.AccountName
HAVING AVG(t.Amount) > (SELECT AVG(Amount) FROM Transactions);