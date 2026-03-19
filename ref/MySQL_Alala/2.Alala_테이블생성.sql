-- ============================================
-- 테이블 생성
-- ============================================

USE Alala;

CREATE TABLE Book (
	bookid      INT NOT NULL,
	bookname    VARCHAR(100) NOT NULL,
	publisher   VARCHAR(50) NOT NULL,
	price       DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (bookid)
);

CREATE TABLE Customer (
	custid      INT NOT NULL,
	name        VARCHAR(30) NOT NULL,
	address     VARCHAR(100) NOT NULL,
	phone       VARCHAR(20) NOT NULL,
	PRIMARY KEY (custid)
);

CREATE TABLE Orders (
	orderid     INT NOT NULL,
	custid      INT NOT NULL,
	bookid      INT NOT NULL,
	saleprice   DECIMAL(10,2) NOT NULL,
	orderdate   DATE NOT NULL,
	PRIMARY KEY (orderid),
	FOREIGN KEY (custid) REFERENCES Customer(custid),
	FOREIGN KEY (bookid) REFERENCES Book(bookid)
);
