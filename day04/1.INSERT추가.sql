-- 한 건 이상 대량 데이터 삽입
INSERT INTO Book VALUES
(31, '살면서 한번은 벽돌', '글항아리', 19500),
(32, '100년 쓰는 완벽 허리', '한즈미디어', 19800),
(33, '60일 영어 습관', '시원스쿨닷컴', 18900);

-- SELECT TOP 3 쿼리
-- LIMIT는 MySQL 문법, SQL표준이 아님
SELECT *
  FROM Orders
 ORDER BY saleprice DESC
 LIMIT 3;