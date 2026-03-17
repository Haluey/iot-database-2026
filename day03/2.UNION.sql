-- 합집합

-- 책 테이블의 책 이름과 가격, 고객 테이블의 고객명과 전화번호를 합하여 조회하시오 
SELECT * FROM Book;
SELECT * FROM Customer;

-- 위쪽 테이블 컬럼명을 따라감. 컬럼의 타입 불일치로 오류가 날 수 있음(형변환 필요)
SELECT bookname AS "대표명"
     , price AS "금액 및 전번" 
  FROM Book
 UNION
SELECT name, phone
  FROM Customer;

-- Book에 있는 데이터를 Book_copy 테이블로 복사하면서 생성
CREATE TABLE Book_copy AS
SELECT bookid, bookname, publisher, price
  FROM Book;

SELECT * FROM Book_copy;

-- 책 테이블과 책 테이블 복사를 합쳐서 책이름과 가격을 조회하시오
-- UNION, UNION ALL 다 확인할 것
SELECT bookname AS "도서명"
     , price AS "가격" 
  FROM Book
 UNION
SELECT bookname
     , price
  FROM Book_copy;
