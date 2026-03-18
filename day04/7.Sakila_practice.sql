/* Sakila 영화 대여 시스템 */

-- 1.ERD 확인

-- 2. sakila 사용할 사용자 생성
-- 반드시 관리자 계정에서 실행
CREATE USER 'sakila_user'@'%' IDENTIFIED BY 'my123456';

-- 3.권한설정
GRANT ALL PRIVILEGES ON sakila.* TO 'sakila_user'@'%';
-- 권한 완전 적용
flush PRIVILEGES;

-- 4. sakila_user로 접속정보 생성

-- 5. 전체 고객 수를 조회하시오
SELECT count(*) AS "Total_Customers"
  FROM customer c;

-- 6. 가장 비싼 영화 Top 5
SELECT f.title
	 , f.replacement_cost
  FROM film f
 ORDER BY f.replacement_cost DESC
 LIMIT 5;

-- 7. 고객별 총 결제금액을 조회하시오
SELECT c.customer_id
     , c.first_name
     , c.last_name
     , SUM(p.amount) "Total_amount"
  FROM customer c
 INNER JOIN payment p
    ON c.customer_id = p.customer_id
 GROUP BY c.customer_id, c.first_name, c.last_name
 ORDER BY Total_amount DESC;

-- 8. TOM MIRANDA라는 배우를 조회하시오
SELECT *
  FROM actor a
 WHERE a.first_name = 'TOM'
   AND a.last_name = 'MIRANDA';

-- 9. 영화별 출연 배우수를 조회하시오
SELECT f.film_id, f.title
     , COUNT(fa.actor_id) AS "Total_Actors"
  FROM film f, film_actor fa
 WHERE f.film_id = fa.film_id
 GROUP BY f.film_id, f.title
 ORDER BY Total_Actors DESC;

-- 영화별 출연 배우수를 조회하면서, 배우가 출연하지 않는 영화도 같이 조회하시오
SELECT f.film_id, f.title
     , COUNT(fa.actor_id) AS "Total_Actors"
  FROM film f
  LEFT OUTER JOIN film_actor fa
    ON f.film_id = fa.film_id
 GROUP BY f.film_id, f.title
 ORDER BY Total_Actors DESC;

-- film id : 257, 323, 803
SELECT * FROM film_actor fa
 WHERE fa.film_id in(257, 323, 803);

-- 10. 카테고리별 영화를 조회하시오
SELECT c.name, f.title, f.rating
  FROM category c
  JOIN film_category fc
    ON c.category_id = fc.category_id
  JOIN film f
    ON fc.film_id = f.film_id;

-- 카테고리별 영화 수를 조회하시오
SELECT IFNULL(c.name, '--합계--') AS "카테고리"
	 , COUNT(fc.film_id) AS "film_count"
  FROM category c
  JOIN film_category fc
    ON c.category_id = fc.category_id
  JOIN film f
    ON fc.film_id = f.film_id
 GROUP BY c.name WITH ROLLUP;
