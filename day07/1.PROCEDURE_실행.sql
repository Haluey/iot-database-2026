-- 프로시저 실행
CALL prc_InsertBook(43, '무명책', '무명도서', 3000000);

SELECT *
  FROM Book;

-- 프로시저 실행 - INSERT
CALL prc_InsertOrUpdateBook(44, '스포츠의 줄거움', '마당체육', 25000);

SELECT *
  FROM Book;

-- 재실행 - UPDATE
CALL prc_InsertOrUpdateBook(44, '스포츠의 줄거움', '마당스포츠', 35000);

SELECT *
  FROM Book;

CALL prc_getAveragePrice(@myVal);
SELECT @myVal;

-- 커서 프로시저 실행, 입출력 파라미터가 없으면 () 생략 가능
CALL prc_getInterest;