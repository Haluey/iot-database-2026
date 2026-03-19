-- Common Table Expression

-- 일반 서브 쿼리
-- 여기 안에서만 사용가능
-- SELECT *
--   FROM (SELECT o.custid, SUM(o.saleprice) AS "TotalPrice"
--   		  FROM Orders o
--  		 GROUP BY o.custid)t
--  WHERE t.TotalPrice > 31000;

-- 구문이 많을 때는 ALT + X로 실행권장
WITH order_sum AS (
	SELECT o.custid
		 , SUM(o.saleprice) AS "TotalPrice"
	  FROM Orders o
	 GROUP BY o.custid
),
customer_sub AS (
	SELECT name, address
	  FROM Customer
)
-- SELECT *
--   FROM order_sum
--  WHERE TotalPrice > 31000;

SELECT *
  FROM customer_sub
 WHERE name = '박지성';
 
-- 1부터 10까지 가상테이블에
WITH RECURSIVE numbers AS (
	SELECT 1 AS num	-- 시작값
	UNION ALL 
	
	SELECT num + 1	-- 이전 수에 + 1
	  FROM numbers
	 WHERE num < 10	-- 종료 조건까지
)
SELECT *
  FROM numbers;
