-- PAIES DB생성
CREATE DATABASE PAIES;

-- 사용자 생성
CREATE USER ies_user IDENTIFIED BY 'my123456';
-- 위와 동일
CREATE USER 'ies_user'@'%' IDENTIFIED BY 'my123456';

-- 권한
GRANT ALL PRIVILEGES ON PAIES.* TO 'ies_user'@'%';
-- 권한 바로 적용
flush PRIVILEGES;
