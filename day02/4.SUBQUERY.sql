-- 책 중에 가장 비싼 도서의 이름을 조회하시오
SELECT MAX(b.price), b.bookname
  FROM Book b
 GROUP BY b.bookname;

SELECT b.price, b.bookname
  FROM Book b;

-- 서브쿼리
SELECT b1.bookname
  FROM Book b1
 WHERE b1.price >= (SELECT MAX(b.price)
  					  FROM Book b);