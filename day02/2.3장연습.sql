-- 도서번호가 1인 도서 이름
SELECT bookname
  FROM Book
 WHERE bookid = 1;
  
-- 가격이 20000원 이상인 도서 이름
SELECT bookname, price
  FROM Book
 WHERE price >= 20000;

-- 박지성의 총 구매액
SELECT sum(saleprice) AS "총 구매액"
  FROM Orders
 WHERE custid = 1
 GROUP BY custid;

SELECT *
  FROM Customer c
 WHERE c.name = '박지성';

SELECT sum(o.saleprice) AS "총 구매액"
  FROM Orders o
 WHERE o.custid = 1;

-- 박지성이 구매한 도서의 수
SELECT count(saleprice) AS "총 도서수"
  FROM Orders
 WHERE custid = 1
 GROUP BY custid;

SELECT count(*) AS "총 구매도서수"
  FROM Orders o
 WHERE custid = 1;

-- 마당서점 도서의 총 개수
SELECT count(*) AS "총 도서수"
  FROM Book;

-- 마당서점에 도서를 출고하는 출판사의 총 개수
SELECT count(DISTINCT publisher) AS "출판사 수"
  FROM Book;

SELECT DISTINCT publisher
  FROM Book;

-- 모든 고객의 이름, 주소
SELECT name, address
  FROM Customer;

-- 2024년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
-- Date형은 문자열이 아니지만 날짜를 검색할 때 문자열로 비교검색 가능
SELECT o.orderid
  FROM Orders o
 WHERE orderdate BETWEEN '2024-07-04'
   AND '2024-07-07';

-- 아래와 같이 문자열을 날짜로 변경해도 가능
SELECT o.orderid
  FROM Orders o
 WHERE orderdate BETWEEN str_to_date('2024-07-04', '%Y-%m-%d')
   AND str_to_date('2024-07-07', '%Y-%m-%d');

-- 2024년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
SELECT o.orderid
  FROM Orders o
 WHERE orderdate NOT BETWEEN '2024-07-04'
   AND '2024-07-07';

-- 성이 '김'씨인 고객의 이름과 주소
SELECT name, address
  FROM Customer c
 WHERE c.name LIKE '김%';

-- 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT name, address
  FROM Customer c
 WHERE c.name LIKE '김_아';
