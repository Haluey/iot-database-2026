-- 함수 원형 fnc_interest
-- 책 가격별 이윤 계산 함수
CREATE FUNCTION madangdb.fnc_interest(
	price INTEGER	-- 파라미터
)
RETURNS INT

BEGIN
	-- 변수 선언
	DECLARE myInterest INTEGER;
	
	-- 가격이 30,000원 이상이면 10%, 그 미만은 5% 이윤남김
	IF price >= 30000 THEN
		SET myInterest = price * 10 / 100;
	ELSE
		SET myInterest = price * 5 / 100;
	END IF;
	
	RETURN myInterest;
END

-- 함수 원형 fnc_balanceGrade
CREATE FUNCTION madangdb.fnc_balanceGrade(
	balance INTEGER
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE grade VARCHAR(20);

	IF balance >= 50000 THEN
		SET grade = 'VIP';
	ELSEIF balance >= 20000 THEN
		SET grade = 'GOLD';
	ELSE
		SET grade = 'SILVER';
	END IF;
	
	RETURN grade;
END