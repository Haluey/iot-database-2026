/* INSERT */

-- Book테이블에 새 책을 추가. '스포츠의학', 출판사 '한솔의학서적', 가격 90,000원
INSERT INTO Book (bookid, bookname, publisher, price)
VALUES (11, '스포츠의학', '한솔의학서적', 90000);

SELECT * FROM Book;

INSERT INTO Book (bookid, bookname, publisher)
VALUES (12, '스포츠의학2', '한솔의학서적');

-- 대량입력 준비
CREATE TABLE Imported_Book (
  bookid      INTEGER,
  bookname   VARCHAR(40),
  publisher   VARCHAR(40),
  price      INTEGER
);

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);
COMMIT;

SELECT * FROM Imported_Book;

SELECT * FROM Book;

-- 대량입력(BULK INSERT)
INSERT INTO Book (bookid, bookname, publisher, price)
SELECT bookid, bookname, publisher, price FROM Imported_Book;

/* UPDATE */

-- Customer에서 고객번호 5번의 고객주소를 '대한민국 부산'으로 수정하시오
SELECT * FROM Customer WHERE custid = 5;

SELECT * FROM Customer;

SET SQL_SAFE_UPDATEs = 1;	-- SQL 안전모드 켜기

UPDATE Customer
   SET address = '대한민국 부산'
     , phone = '010-9090-0909'
 WHERE custid = 5;	-- where절이 빠지는 순간, 끔찍한 일이 벌어짐
 
-- 14번 데이터 추가 
INSERT INTO Book (bookid, bookname, publisher)
VALUES (14, '스포츠의학3', 'Pearson');

SELECT * FROM Book;

SELECT publisher
  FROM Imported_Book
 WHERE bookid = 22;

-- 서브쿼리를 활용해서 UPDATE 수행
-- Book테이블의 14번 책 출판사를 Imported_Book 22번
-- 책 출판사와 동일하게 변경하시오
UPDATE Book
   SET publisher = (SELECT publisher
  					  FROM Imported_Book
 					 WHERE bookid = 22)
 WHERE bookid = 14;

/* DELETE */
-- 수정과 삭제 전 아래 쿼리 확인
SELECT * FROM Book_copy
 WHERE bookid = 6;

DELETE FROM Book_copy
 WHERE bookid = 6;

DELETE FROM Book_copy;

-- Customer 복사
CREATE TABLE Customer_Copy
SELECT * FROM Customer;

SELECT * FROM Customer_Copy;

-- 삭제여부 컬럼 추가
ALTER TABLE Customer_Copy
 ADD COLUMN ISDEL CHAR(1);

-- 삭제를 하지 않고 삭제플래그를 활용
-- 아래 방식이 아닌
DELETE FROM Customer_Copy
 WHERE custid = 4;
 
-- 이 방식으로 진행(실제 실무에서)
UPDATE Customer_Copy
   SET ISDEL = 'Y'
 WHERE custid = 4;

-- ISDEL이 NULL이거나 'N'(탈퇴하지 않음)
SELECT * FROM Customer_Copy
 WHERE ISDEL IS NULL
    OR ISDEL = 'N';
