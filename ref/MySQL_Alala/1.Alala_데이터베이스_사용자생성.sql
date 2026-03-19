-- ============================================
-- 기존 환경 초기화 (필요하면 사용)
-- ============================================
DROP DATABASE IF EXISTS Alala;

-- ============================================
-- 데이터베이스 / 사용자 생성
-- ============================================
CREATE DATABASE Alala;

CREATE USER IF NOT EXISTS 'AlalaUser'@'%' IDENTIFIED BY 'my123456';
GRANT ALL PRIVILEGES ON Alala.* TO 'AlalaUser'@'%';
FLUSH PRIVILEGES;

USE Alala;
