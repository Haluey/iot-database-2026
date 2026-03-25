SELECT * FROM Book;

SELECT bookid, bookname, publisher, price
FROM Book;

INSERT INTO madangdb.Book
(bookid, bookname, publisher, price)
VALUES(0, '', '', 0);

UPDATE madangdb.Book
SET bookname='', publisher='', price=0
WHERE bookid=0;

DELETE FROM madangdb.Book
WHERE bookid=0;

-- count는 *로! 속도가 bookid로 설정한것보다 빠름
-- 그리고 null이 있으면 카운트가 안되서 *로 하는게 맞음
SELECT count(*)
  FROM Book;