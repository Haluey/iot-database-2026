-- 대량삽입 저장프로시저 실행
CALL insert_big_orders(10);	-- 한번에 100만건씩 10번 수행

-- orders_big 테이블 데이터갯수 확인
SELECT COUNT(*) FROM orders_big;