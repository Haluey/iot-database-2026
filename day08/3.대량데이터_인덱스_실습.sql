-- oreders_big 테이블 생성
CREATE TABLE orders_big (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    amount INT NOT NULL,
    city VARCHAR(50) NOT NULL,
    memo VARCHAR(100) NULL
);

-- 0~999 숫자 테이블 생성
CREATE TABLE nums (
    n INT PRIMARY KEY
);

INSERT INTO nums (n)
WITH RECURSIVE seq AS (
    SELECT 0 AS n
    UNION ALL
    SELECT n + 1
    FROM seq
    WHERE n < 999
)
SELECT n
FROM seq;

SELECT * FROM nums;