REM   Script: CST3624_LAB3
REM   Project for creating and filling data tables after normalization and queries to test

select * from customer;

select * from CUSTOMER;

select * from CUSTOMER;

CREATE TABLE CUSTOMER 
( 
CUSTOMER_ID INT PRIMARY KEY, 
CUSTOMER_NAME CHAR(20), 
ADDRESS CHAR(30), 
ORDER_ID INT);

CREATE TABLE ORDERS 
( 
ORDER_ID INT PRIMARY KEY, 
ORDER_NAME CHAR(20), 
PRICEPERUNIT INT, 
ONHAND INT);

CREATE TABLE VENDOR 
( 
VENDOR_ID INT PRIMARY KEY, 
VENDOR_NAME CHAR(25), 
ORDER_ID INT);

INSERT  
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID)   
VALUES (1,'Alice','13-14 5th Ave', 1);

INSERT  
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID)  
VALUES (2,'Alice','13-14 5th Ave', 2);

INSERT 
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID)  
VALUES (3,'Alice','13-14 5th Ave', 3);

INSERT 
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID) 
VALUES (4,'Bill','55 Maple Dr.', 4);

INSERT 
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID) VALUES (5,'Bill','55 Maple Dr.', 5);

INSERT 
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID) VALUES (6,'Caitlin','1 Oak Road Apt. 3A', 1);

INSERT 
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID) VALUES (7,'Elizabeth','16 Sunshine Lane', 6);

INSERT 
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID) VALUES (8,'Laura','66 East 4th Street', 7);

INSERT 
INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_NAME, ADDRESS, ORDER_ID)  
VALUES (9,'Laura','66 East 4th Street', 4);

INSERT 
INTO ORDERS (ORDER_ID, ORDER_NAME, PRICEPERUNIT, ONHAND)  
VALUES (1,'Plums',1, 100);

INSERT 
INTO ORDERS (ORDER_ID, ORDER_NAME, PRICEPERUNIT, ONHAND)  
VALUES (2,'Oranges',3, 300);

INSERT 
INTO ORDERS (ORDER_ID, ORDER_NAME, PRICEPERUNIT, ONHAND)  
VALUES (3,'Pears',4, 400);

INSERT 
INTO ORDERS (ORDER_ID, ORDER_NAME, PRICEPERUNIT, ONHAND)  
VALUES (4,'Apples',2, 200);

INSERT 
INTO ORDERS (ORDER_ID, ORDER_NAME, PRICEPERUNIT, ONHAND)  
VALUES (5,'Bananas',5, 500);

INSERT 
INTO ORDERS (ORDER_ID, ORDER_NAME, PRICEPERUNIT, ONHAND)  
VALUES (6,'Kiwi',7, 700);

INSERT 
INTO ORDERS (ORDER_ID, ORDER_NAME, PRICEPERUNIT, ONHAND)  
VALUES (7,'Plums',6, 600);

INSERT 
INTO VENDOR (VENDOR_ID, VENDOR_NAME, ORDER_ID)  
VALUES (1,'Very Fresh',1);

INSERT 
INTO VENDOR (VENDOR_ID, VENDOR_NAME, ORDER_ID)  
VALUES (2,'Very Fresh',4);

INSERT 
INTO VENDOR (VENDOR_ID, VENDOR_NAME, ORDER_ID)  
VALUES (3,'Garden Heaven',2);

INSERT 
INTO VENDOR (VENDOR_ID, VENDOR_NAME, ORDER_ID)  
VALUES (4,'Garden Heaven',5);

INSERT 
INTO VENDOR (VENDOR_ID, VENDOR_NAME, ORDER_ID)  
VALUES (5,'Produce One',3);

INSERT 
INTO VENDOR (VENDOR_ID, VENDOR_NAME, ORDER_ID)  
VALUES (6,'Veggie Heaven',6);

INSERT 
INTO VENDOR (VENDOR_ID, VENDOR_NAME, ORDER_ID)  
VALUES (7,'Veggie Heaven',7);

CREATE TABLE TRANSACTIONS 
( 
CUSTOMER_ID INT, 
ORDER_ID INT, 
AMOUNT INT, 
VENDOR_ID INT, 
 
CONSTRAINT CUSTOMER_ID_FK  FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID), 
CONSTRAINT ORDER_ID_FK FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID), 
CONSTRAINT VENDOR_ID_FK FOREIGN KEY (VENDOR_ID) REFERENCES VENDOR(VENDOR_ID) 
);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (1,1,40,1);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (2,2,30,3);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (3,3,10,5);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (2,2,40,3);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (4,4,50,2);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (5,5,100,4);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (5,5,100,4);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (6,1,40,1);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (6,1,40,1);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (7,6,30,6);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (8,7,60,7);

INSERT 
INTO TRANSACTIONS (CUSTOMER_ID, ORDER_ID, AMOUNT, VENDOR_ID)  
VALUES (9,4,10,2);

SELECT * FROM TRANSACTIONS 
 
 
SELECT * FROM CUSTOMER 
 
SELECT * FROM ORDERS 
 
SELECT * FROM VENDOR 
 
-- -- Returning name and address of customers that have ordered plums 
SELECT CUSTOMER.CUSTOMER_NAME, CUSTOMER.ADDRESS 
FROM CUSTOMER, TRANSACTIONS 
WHERE CUSTOMER.CUSTOMER_ID=TRANSACTIONS.CUSTOMER_ID 
AND TRANSACTIONS.ORDER_ID=1 
ORDER BY CUSTOMER.CUSTOMER_NAME ASC;

SELECT ORDERS.ORDER_NAME, ORDERS.PRICEPERUNIT, VENDOR.VENDOR_NAME 
FROM ORDERS, TRANSACTIONS, VENDOR 
WHERE ORDERS.ORDER_ID=TRANSACTIONS.ORDER_ID 
AND (TRANSACTIONS.VENDOR_ID=1 OR TRANSACTIONS.VENDOR_ID=2) 
AND VENDOR.VENDOR_ID=TRANSACTIONS.VENDOR_ID 
ORDER BY ORDERS.ORDER_NAME ASC;

SELECT CUSTOMER.CUSTOMER_NAME, ORDERS.ORDER_NAME, TRANSACTIONS.AMOUNT 
FROM ORDERS, TRANSACTIONS, CUSTOMER 
WHERE ORDERS.ORDER_ID=TRANSACTIONS.ORDER_ID 
AND CUSTOMER.CUSTOMER_NAME='Alice' 
AND CUSTOMER.CUSTOMER_ID=TRANSACTIONS.CUSTOMER_ID 
ORDER BY TRANSACTIONS.AMOUNT ASC;

