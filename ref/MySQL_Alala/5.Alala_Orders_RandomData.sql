USE Alala;

SET SESSION cte_max_recursion_depth = 3000;

-- ============================================
-- Orders 2000건 입력
--    saleprice는 Book.price를 기준으로 할인율 적용
-- ============================================
INSERT INTO Orders (orderid, custid, bookid, saleprice, orderdate)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM seq
    WHERE n < 2000
),
ord_base AS (
    SELECT
        n AS orderid,
        MOD(n * 37, 1000) + 1 AS custid,
        MOD(n * 53, 1000) + 1 AS bookid,
        DATE_SUB(CURDATE(), INTERVAL MOD(n * 7, 365) DAY) AS orderdate,
        CASE MOD(n, 5)
            WHEN 0 THEN 1.00
            WHEN 1 THEN 0.95
            WHEN 2 THEN 0.90
            WHEN 3 THEN 0.85
            ELSE 0.80
        END AS discount_rate
    FROM seq
)
SELECT
    o.orderid,
    o.custid,
    o.bookid,
    CAST(ROUND(b.price * o.discount_rate, 2) AS DECIMAL(10,2)) AS saleprice,
    o.orderdate
FROM ord_base o
JOIN Book b
    ON o.bookid = b.bookid;
