-- 1번
SELECT m.member_name AS "회원명"
     , b.book_name AS "책제목"
     , r.rentalDate AS "대여일"
  FROM members m
  JOIN rentals r
    ON m.member_idx = r.member_idx
  JOIN books b
    ON r.book_idx = b.book_idx
 WHERE r.returnDate IS NULL;

-- 2번
SELECT r.member_idx AS "회원번호"
     , m.member_name AS "회원명"
     , COUNT(r.member_idx) AS "대여횟수"
  FROM rentals r
  JOIN members m
    ON r.member_idx = m.member_idx
 GROUP BY r.member_idx
 ORDER BY COUNT(r.member_idx) DESC
        , m.member_name;

-- 3번
SELECT d.div_code AS "장르코드"
     , d.div_name AS "장르명"
     , COUNT(b.div_code) AS "도서수"
  FROM division d
  LEFT JOIN books b
    ON d.div_code = b.div_code
 GROUP BY d.div_code;

-- 4번
SELECT b.book_name AS "책제목"
  FROM books b
  LEFT JOIN rentals r
    ON b.book_idx = r.book_idx
  WHERE r.rental_idx IS NULL;
 
-- 5번
SELECT g.member_idx AS "회원번호"
	 , g.member_name AS "회원명"
	 , g.Total_rental AS "대여횟수"
  FROM (SELECT r.member_idx
  			 , m.member_name
             , COUNT(r.member_idx) AS "Total_rental"
  		  FROM rentals r
  		  JOIN members m
  		    ON r.member_idx = m.member_idx
 		 GROUP BY r.member_idx) AS g
 WHERE g.Total_rental > (SELECT AVG(t.Total_rental)
  		  				   FROM (SELECT r.member_idx, COUNT(r.member_idx) AS "Total_rental"
  		         				   FROM rentals r
 		         		  		  GROUP BY r.member_idx) AS t);
