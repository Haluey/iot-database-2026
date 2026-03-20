-- 세션 2번

SELECT @@autocommit;

SET autocommit = 0;

-- START TRANSACTION;

UPDATE accounts
   SET balance = balance - 500
 WHERE id = 2;

SELECT * FROM accounts;

COMMIT;

-- 다른 세션에서 다른 데이터를 수정

UPDATE accounts
   SET balance = balance - 1500
 WHERE id = 3;

SELECT * FROM accounts;

COMMIT;
ROLLBACK;

-- Non-Reapeatable Read
-- 격리수준 하강
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 격리수준 원상태 복귀
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

UPDATE accounts
   SET balance = 30000
 WHERE id = 1;

SELECT * FROM accounts;

COMMIT;

-- Phantom Read 세션2
INSERT INTO employees (name, salary) VALUES ('Dred', 6500);

SELECT * FROM accounts;

ROLLBACK;

-- Deadlock
-- AutoCommit을 해제
SELECT @@autocommit;
SET autocommit = 0;

SELECT * FROM employees;

-- 6번 ID 급여 8000으로 변경
UPDATE employees
   SET salary = 8000
 WHERE id = 6;

-- 다른 세션의 5번 ID 급여를 100증가
UPDATE employees
   SET salary = salary + 100
 WHERE id = 5;

UPDATE accounts
   SET balance = 7000
 WHERE id = 2;

 -- 테이블 락
SELECT * FROM accounts;

UPDATE accounts
   SET balance = 9000
 WHERE id = 3;

ROLLBACK;