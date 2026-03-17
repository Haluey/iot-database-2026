/* CREATE  */

-- TABLE
-- NewBook 테이블 생성
CREATE TABLE NewBook(
	bookid INTEGER,
	BOOKNAME VARCHAR(20),
	publisher VARCHAR(20),
	price DECIMAL(10, 2)
);

-- 컬럼은 대소문자 구분없음. 테이블, 객체명은 대소문자 구분
-- MySQL 해당버전 특징
SELECT BOOKID, bookname, PUBLISHER, PRICE
  FROM NewBook;

-- 테이블 삭제
DROP TABLE NewBook;

-- NewBook 테이블 생성
-- 기본키 추가해서 생성
CREATE TABLE NewBook(
	bookid INTEGER PRIMARY KEY,
	BOOKNAME VARCHAR(20) NOT NULL,
	publisher VARCHAR(20) NOT NULL,
	price DECIMAL(10, 2) NOT NULL
);

-- 제약조건을 따로 적는 방법
-- 기본키가 하나 이상이면 반드시 아래의 방법으로 작성
-- PRIMARY KEY(bookid, bookname)
CREATE TABLE NewBook(
	bookid INTEGER,
	BOOKNAME VARCHAR(20) NOT NULL,
	publisher VARCHAR(20) UNIQUE,
	price DECIMAL(10, 2) DEFAULT 10000 CHECK(price > 1000),
	PRIMARY KEY(bookid, bookname)
);

-- PRIMARY KEY는 UNIQUE, NOT NULL
-- 무결성유지를 따라가기 위해 만든 조건 NOT NULL
INSERT INTO NewBook (bookid, bookname, publisher, price)
VALUES (1, '야구의 추억', '대한미디어', 9000);

INSERT INTO NewBook (bookid, bookname, publisher)
VALUES (2, '골프 바이블', '이상미디어');

INSERT INTO NewBook (bookid, bookname, publisher, price)
VALUES (3, '골프여제 박세리', 'Pearson', 1001);
