/* 트랜잭션 기본 */

-- 계좌 테이블 생성
CREATE TABLE accounts (
	id INT PRIMARY KEY,
	owner VARCHAR(40),
	balance INT
);

-- 데이터 추가
INSERT INTO accounts (id, owner, balance)
VALUES (1, 'Kim', 10000),(2, 'Lee', 20000), (3, 'Sung', 10000000);

-- 트랜잭션 사용가능 여부 확인
-- 1 자동커밋 상태(트랜잭션 확인불가)
-- 0 트랜잭션 사용 모드
SELECT @@autocommit;

-- 자동커밋 끄기
SET autocommit = 0;

-- 트랜잭션 사용순서
START TRANSACTION;


COMMIT;
ROLLBACK;

-- 1. Kim 계좌에서 1000원 출금
START TRANSACTION;

UPDATE accounts
   SET balance = balance - 1000
 WHERE id = 1;
   
SELECT * FROM accounts;

COMMIT;
ROLLBACK;

-- 2. Lee 계좌에서 30000원 출금
START TRANSACTION;

UPDATE accounts
   SET balance = balance - 30000
 WHERE id = 2;
   
SELECT * FROM accounts;

COMMIT;
ROLLBACK;

-- 3. Kim -> Sung 5000원 송금
START TRANSACTION;

-- kim에서 출금
UPDATE accounts
   SET balance = balance - 5000
 WHERE id = 1;

-- sung에게 입금
UPDATE accounts
   SET balance = balance + 5000
 WHERE id = 3;
 
SELECT * FROM accounts;
 
COMMIT;
ROLLBACK;

-- 4. Kim -> Lee 송금 중 문제 발생
START TRANSACTION;

-- kim에서 출금
UPDATE accounts
   SET balance = balance - 1000
 WHERE id = 1;

SAVEPOINT sp_transfer;

-- lee에게 입금
UPDATE accounts
   SET balance = balance + 1000
 WHERE id = 2;
 
SELECT * FROM accounts;

ROLLBACK TO sp_transfer;

ROLLBACK;
COMMIT;

