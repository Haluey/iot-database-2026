USE Alala;

-- ============================================
-- 대량 데이터 생성 준비
--    재귀 CTE 최대 깊이 설정
-- ============================================
SET SESSION cte_max_recursion_depth = 5000;

-- ============================================
-- Book 1000건 입력
-- ============================================
INSERT INTO Book (bookid, bookname, publisher, price)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM seq
    WHERE n < 1000
)
SELECT
    n AS bookid,
    CONCAT(
        ELT(1 + MOD(n * 3, 10),
            '쉽게 배우는', '실전', '한 권으로 끝내는', '처음 만나는', '제대로 배우는',
            '현업에서 쓰는', '프로처럼 다루는', '입문자를 위한', '핵심만 보는', '완벽 정리'
        ),
        ' ',
        ELT(1 + MOD(n * 5, 12),
            'SQL', '데이터베이스', 'MySQL', '파이썬', 'C++', '알고리즘',
            '웹개발', '데이터 분석', 'AI', 'IoT', '리눅스', '네트워크'
        ),
        ' ',
        ELT(1 + MOD(n * 7, 10),
            '입문', '실습', '가이드', '활용법', '프로그래밍', '설계',
            '프로젝트', '핵심 정리', '트레이닝', '마스터북'
        )
    ) AS bookname,
    ELT(1 + MOD(n * 11, 8),
        '한빛미디어', '길벗', '위키북스', '인사이트',
        '에이콘출판', '제이펍', '비제이퍼블릭', '영진닷컴'
    ) AS publisher,
    CAST((15000 + MOD(n * 137, 35000)) DIV 100 * 100 AS DECIMAL(10,2)) AS price
FROM seq;
