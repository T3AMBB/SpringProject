CREATE TABLE COUPON(
   CID INT PRIMARY KEY,
   CODE VARCHAR(50) NOT NULL,
   DCRATE DOUBLE NOT NULL,
   CSTATUS INT DEFAULT 0,
   MID VARCHAR(20) NOT NULL
);

DROP TABLE COUPON;
SELECT * FROM COUPON;