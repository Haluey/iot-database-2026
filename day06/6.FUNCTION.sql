-- root 관리자로 실행
-- 함수 안정성 체크 안 함
SET GLOBAL log_bin_trust_function_creators = 1;

-- 함수 사용, 스칼라 값
SELECT o.orderid
	 , o.custid
	 , o.bookid 
	 , o.saleprice
	 , fnc_interest(o.saleprice) AS "interest"
	 , o.orderdate
  FROM Orders o;
  
-- 함수 사용
INSERT INTO accounts (id, owner, balance)
VALUES (4, 'Park', 60000);

SELECT id, owner, balance
	 , fnc_balanceGrade(balance) AS "grade"
  FROM accounts;