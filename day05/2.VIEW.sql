-- 뷰
-- 뷰 생성 전
SELECT *
  FROM (SELECT c.custid, c.name, b.bookid, b.price, o.orderid, o.saleprice, o.orderdate
  		  FROM Customer c
  		  JOIN Orders o
    		ON c.custid = o.custid
  		  JOIN Book b
    		ON o.bookid = b.bookid) v
 WHERE v.custid = 4;

-- 뷰 생성
CREATE VIEW v_orders AS 
SELECT c.custid, c.name, b.bookid, b.price, o.orderid, o.saleprice, o.orderdate
  FROM Customer c
  JOIN Orders o
	ON c.custid = o.custid
  JOIN Book b
  	ON o.bookid = b.bookid;

-- 뷰 생성 후
SELECT *
  FROM v_orders v
 WHERE v.custid = 4;

SELECT v.name, v.price, v.saleprice, v.orderdate
  FROM v_orders v;

-- v_book 생성
CREATE VIEW v_book AS
SELECT *
  FROM Book;

-- 단일 테이블로 만들어진 뷰는 INSERT, UPDATE, DELETE 가능
INSERT INTO v_book
VALUES (40, '에이리언 어스', '파라마운트미디어', 20000);

UPDATE v_book
   SET publisher = '20세기미디어'
 WHERE bookid = 40;

-- 뷰 생성/수정
CREATE OR REPLACE VIEW v_orders AS 
SELECT c.custid, c.name
	 , b.bookid, b.bookname, b.price
	 , o.orderid, o.saleprice, o.orderdate
  FROM Customer c
  JOIN Orders o
  	ON c.custid = o.custid
  JOIN Book b
  	ON o.bookid = b.bookid;

-- 뷰 삭제
DROP VIEW v_book;
