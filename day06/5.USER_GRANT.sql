-- 사용자 생성
CREATE USER 'minju03'@'%' IDENTIFIED BY 'MY123456';

-- 접속은 가능하지만 선택된 DB가 없어 어떤 것도 처리불가

-- 사용자 비밀번호 변경
ALTER USER 'minju03'@'%' IDENTIFIED BY 'my123456';

-- 사용자 삭제
DROP USER 'minju03';

-- 권한 부여
GRANT ALL PRIVILEGES ON world.* TO 'minju03'@'%';
GRANT ALL PRIVILEGES ON sakila.* TO 'minju03'@'%';
GRANT ALL PRIVILEGES ON madangdb.* TO 'minju03'@'%';

-- 권한 해제
REVOKE ALL PRIVILEGES ON madangdb.* FROM 'minju03'@'%';