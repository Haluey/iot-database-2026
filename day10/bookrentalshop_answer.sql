-- 1. 현재 대여중인 도서 조회하시오
SELECT m.member_name AS "회원명"
     , b.book_name "책제목"
     , r.rentalDate "대여일"
  FROM rentals r
  JOIN members m
    ON r.member_idx = m.member_idx
  JOIN books b
    ON r.book_idx = b.book_idx
 WHERE r.returnDate IS NULL
 ORDER BY r.rentalDate;

-- 2. 회원별 대여 횟수를 집계하시오
SELECT r.member_idx
     , m.member_name 
     , count(*) AS "대여횟수"
  FROM rentals r
  JOIN members m
    ON r.member_idx = m.member_idx 
 GROUP BY r.member_idx, m.member_name
 ORDER BY COUNT(*) DESC, m.member_name;

-- 3. 장르별 도서수 조회하시오
SELECT d.div_code "장르코드"
     , d.div_name "장르명"
     , count(b.book_idx) "도서수"
  FROM books b
 RIGHT JOIN division d
    ON b.div_code = d.div_code
 GROUP BY d.div_code, d.div_name
 ORDER BY d.div_code;
  
-- 4. 한번도 대여되지 않은 도서 
SELECT b.book_idx 
     , b.book_name 
     , b.author 
  FROM books b
  LEFT JOIN rentals r
    ON b.book_idx = r.book_idx
 WHERE r.rental_idx IS NULL;

-- 5. 평균 대여수보다 많이 대여한 회원 조회하시오
SELECT r.member_idx "회원번호"
     , m.member_name "회원명"
     , count(*) AS "대여횟수"
  FROM rentals r
  JOIN members m
    ON r.member_idx = m.member_idx 
 GROUP BY r.member_idx, m.member_name
HAVING count(*) >= (
					SELECT avg(t.cnt)
					  FROM (SELECT count(*) AS cnt
					          FROM rentals r
					         GROUP BY r.member_idx
					       ) t
					);
