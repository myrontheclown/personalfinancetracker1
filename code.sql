CREATE TABLE `Account`(
    `AccountID` INT(11) NOT NULL,
    `UserID` INT(11) NOT NULL,
    `AccountType` ENUM('Savings', 'Business') NOT NULL,
    `Balance` DECIMAL(15, 2) DEFAULT 0.00,
    `CreatedDate` DATETIME DEFAULT CURRENT_TIMESTAMP()) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;


    CREATE TABLE `Budget`(
        `BudgetID` INT(11) NOT NULL,
        `UserID` INT(11) NOT NULL,
        `BudgetAmount` DECIMAL(15, 2) NOT NULL,
        `StartDate` DATE DEFAULT NULL,
        `EndDate` DATE DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;


    CREATE TABLE `Transaction`(
        `TransactionID` INT(11) NOT NULL,
        `AccountID` INT(11) NOT NULL,
        `PaymentMethod` ENUM('Cash', 'Card', 'UPI', 'Bank Transfer') NOT NULL,
        `TransactionDate` DATETIME DEFAULT CURRENT_TIMESTAMP(), `Amount` DECIMAL(10, 2) NOT NULL, `TransactionType` ENUM('Deposit', 'Withdraw') NOT NULL, `Category` VARCHAR(100) DEFAULT NULL, `ActualSpent` DECIMAL(10, 2) DEFAULT NULL) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

        CREATE TABLE `User`(
            `UserID` INT(11) NOT NULL,
            `FullName` VARCHAR(100) NOT NULL,
            `Email` VARCHAR(100) NOT NULL,
            `Password` VARCHAR(255) NOT NULL,
            `Address` VARCHAR(255) DEFAULT NULL,
            `Phone` VARCHAR(15) DEFAULT NULL,
            `CreatedDate` DATETIME DEFAULT CURRENT_TIMESTAMP()) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;


            ALTER TABLE
                `Account` ADD PRIMARY KEY(`AccountID`),
                ADD KEY `UserID`(`UserID`);
--

            ALTER TABLE
                `Budget` ADD PRIMARY KEY(`BudgetID`),
                ADD KEY `UserID`(`UserID`);
  
            ALTER TABLE
                `Transaction` ADD PRIMARY KEY(`TransactionID`),
                ADD KEY `AccountID`(`AccountID`);
       

            ALTER TABLE
                `User` ADD PRIMARY KEY(`UserID`),
                ADD UNIQUE KEY `Email`(`Email`);
     

            ALTER TABLE
                `Account` MODIFY `AccountID` INT(11) NOT NULL AUTO_INCREMENT,
                AUTO_INCREMENT = 2;
 

            ALTER TABLE
                `Budget` MODIFY `BudgetID` INT(11) NOT NULL AUTO_INCREMENT;
     

            ALTER TABLE
                `Transaction` MODIFY `TransactionID` INT(11) NOT NULL AUTO_INCREMENT;


            ALTER TABLE
                `User` MODIFY `UserID` INT(11) NOT NULL AUTO_INCREMENT;
     

            ALTER TABLE
                `Account` ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY(`UserID`) REFERENCES `User`(`UserID`);

            ALTER TABLE
                `Budget` ADD CONSTRAINT `budget_ibfk_1` FOREIGN KEY(`UserID`) REFERENCES `User`(`UserID`);
        

            ALTER TABLE
                `Transaction` ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY(`AccountID`) REFERENCES `Account`(`AccountID`);

             
