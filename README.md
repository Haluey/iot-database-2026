# iot-database-2026
2026년 IoT개발자 데이터베이스 리포지토리

## 1일차

### 데이터/정보/지식

- `데이터` Data : 단순한 수치가 값
- `정보` Information : 데이터의 의미를 부여한 것
- 지식 Knowlege : 정보를 통한 사물이나 현상에 대한 이해

### 데이터베이스 DataBase

- 조직에 필요한 정보를 위해서 논리적으로 연관된 데이터를 구조적으로 통합, 저장해 놓은 것
- `도메인` Domain - 자기 업무에 관련된 지식
- 기업/기관은 자기 도메인 정보만 저장
- 보통 `CS`(Client - Server) 프로그램이라고 명칭. DB쪽이 서버, 프로그램쪽이 클라이언트

#### 데이터베이스 개념

- 통합 데이터 - `데이터 중복 최소화`, 중복으로 인한 데이터 `불일치 현상 제거`
- 저장 데이터 - 문서가 아닌 `컴퓨터 저장장치에 저장`, 반영구적 저장
- 운영 데이터 - 저장된 상태에서 `업무를 위해 사용`. 검색, 수정 등
- 공용 데이터 - 여러 사람이 업무를 위해서 `공동으로 사용`

#### 데이터베이스 특징

- 실시간 접근성 - 수 초내 결과 리턴
- 계속적 변환 - 추가, 수정, 조회, 삭제가 가능
- 동시 공유 - 여러 사용자가 동시에 공유. 같은 데이터를 사용하더라도 최대한 문제가 없게 처리
- 내용에 따른 참조 - 물리적인 저장 데이터가 아닌 데이터값을 참조

#### DBMS

- 데이터베이스를 관리하는 시스템 DataBase Management System의 약자.
- DBMS를 데이터베이스, DB로 통칭

#### DBMS 장점

- `데이터 중복 최소화`, 데이터 일관성, 데이터 독립성, 관리기능(백업, 복구, `동시성 제어`, 계정, 보안), 개발 생산성, `데이터 무결성 유지`, 데이터 표준 준수 등

### 데이터베이스 설치

#### 로컬 설치

1. https://www.mysql.com/ 사이트 다운로드 메뉴
2. MySQL Community Edition 아래 링크 클릭
3. MySQL Installer for Windows 링크 클릭
4. MySQL Installer 8.0.45, Windows (x86, 32-bit), MSI Installer 500MB 이상 다운로드
5. 회원가입이나 로그인 없이 No thanks, just start my download. 클릭
6. mysql-installer-community-8.0.45.0.msi 실행

    ![alt text](image.png)

    ![alt text](image-1.png)

    ![alt text](image-2.png)

7. 일반적인 프로그램 설치와 동일

#### 도커사용 설치

- `Docker` - 애플리케이션 신속 구축, 테스트, 서비스할 수 있는 `컨테이너 기반의 가상화 플랫폼`
    - 온라인 상에서 이미지를 다운로드(Pull)
    - 실행하는 컨테이너로 만듦(Run)


1. 도커 설치
    - https://www.docker.com/ 사이트 Download Docker Desktop 클릭
    - Docker Desktop Installer.exe 실행
    - Download for Windows - AMD64 클릭

        ![alt text](image-3.png)

        ![alt text](image-4.png)

        ![alt text](image-5.png)

    - Close And Restart로 재부팅
    - Docker Subsription Servie Agreement 창 Accept 클릭
    - Linux용 Windows 하위 시스템 설치 필수, `wsl --update` 실행

        ![alt text](image-6.png)

2. 도커 설정
    - 설정 > Start Docker Desktop when you sign in to your computer 체크

3. 도커 콘솔 명령어
    ```powershell
    > docker
    > docker --version
    > docker search 이미지명
    > docker pull 이미지명
    > docker runs
    ```

4. MySQL 설치
    - PowerShell 열기
    - docker search는 도커허브 검색 기능

    ```powershell
    > docker search mysql
    ```

    - docker pull 이미지 다운

    ```powershell
    > docker pull mysql:8.0.45
    ```
    ![alt text](image-7.png)

    - docker 컨테이너 실행

    ```powershell
    # \는 윈도우에서 사용불가, 여러줄 명령 불가능
    > docker run -d --name mysql80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my123456 -e MYSQL_DATABASE=mydb -e MYSQL_USER=myuser -e MYSQL_PASSWORD=my123456 -v mysql80_data:/var/lib/mysql --restart unless-stopped mysql:8.0.45
    ```

    - 필요 계정
        - root(관리자) - my123456
        - myuser(일반 사용자) - my123456

    - 옵션 설명
        - `--name mysql80` : 컨테이너 이름
        - `-p 3306:3306` : 포트번호 컴퓨터에서 접근하는 포트:컨테이너 내부 포트
        - `MYSQL_ROOT_PASSWORD` : Mysql 관리자 root계정 비밀번호 초기화
        - `MYSQL_DATABASE` : 컨테이너 시작 시 자동 생성할 DB
        - MYSQL_USER / MYSQL_PASSWORD : 일반 사용자 계정
        - -v mysql80_data:/var/lib/mysql : 컨테이너 내 mysql 데이터 저장위치
        - --restart unless-stopped : 도커 재시작 시 자동 복구

    - docker ps - 현재 실행 중인 컨테이너 확인

    - docker exec - 도커 컨테이너 내부 접속

    ```powershell
    docker exec -it mysql80 mysql -u root -p
    Enter password:
    ```

5. MySQL WorkBench 설치

    - Database 개발툴. MySQL 기본툴
    - 로컬에서 다운로드한 mysql-installer-community-8.0.45.0.msi 실행
    - 
    - MySQL Connections 옆 동그라미 + 아이콘 클릭
    
        ![alt text](image-8.png)

        ![alt text](image-9.png)

6. `DBeaver` 개발툴 설치

    - https://dbeaver.io/ 다운로드
    - Download EXE 클릭

7. Visual Studio Code DB확장 설치

    ![alt text](image-10.png)

    - 확장 > Database 검색
    - Database Client 설치
    - Database 아이콘 클릭 > Create Connection 버튼 클릭

    ![alt text](image-11.png)

#### MySQL 접속

- 관리자 계정 - root
    - 새 사용자 생성, 새 데이터베이스 생성, 권한, 백업 및 복구
- 일반 계정 - myuser, madang
    - 해당 데이터베이스에서 데이터 처리 작업

### 기본 이론

#### 관계형 데이터베이스

- Relational Database
    - 1969년 E.F.Codd 수학 모델에 근간해서 고안
    - 테이블을 최소 단위로 구성
    - 각 테이블 간 관계를 통해서 데이터 모델 구성

#### 데이터베이스 종류

- `관계형 데이터베이스`
    - Oracle, SQL Server(MS), `MySQL`(Oracle), MariaDB, PostgreSQL(오픈소스)

- NoSQL 데이터베이스
    - MongoDB, Redis, Apache Cassandra 등

- In-memory 데이터베이스
    - SAP HANA 등

#### SQL

- Structured Query Language
    - `구조화된 질의 언어`
    - 데이터베이스에서 데이터를 조작하고, 테이블과 같은 객체를 컨트롤하는 등의 작업을 수행하는 프로그래밍 언어

- SQL 종류

    - `Data Manipulation Language` - 데이터 조작어. `SELECT`, `INSERT`, `UPDATE`, `DELETE`와 같은 데이터를 조작하는 언어.

    - `Data Definition Language` - 데이터 정의어. `CREATE`, `ALTER`, `RENAME`, `DROP` 같은 객체(데이터베이스, 테이블, 사용자, 뷰, 인덱스 등)를 처리하는 언어.

    - `Data Control Language` - 데이터 제어어. `GRANT`, `REVOKE` 와 같이 사용자에게 권한주고 해제하는 기능을 처리하는 언어.

    - `Transaction Control Language` - 트랜잭션 제어어, `BEGIN TRAN`, `COMMIT`, `ROLLBACK` 같은 트랜잭션 처리로 동시성 제어를 위한 언어.


### SELECT 실습

- DBeaver 설정
    - 환경설정 > 편집기 > SQL 편집기 > SQL 포맷
    - Keyword case UPPER로 변경

        ![alt text](image-12.png)

- 기본 문법

    ```sql
    -- 기본 조회 쿼리, * -> ALL(올)이라고 호칭, ALL 키워드와 다름
    SELECT *
      FROM 테이블명;

    -- 컬럼(열) 명시할 때나 열 순서를 바꿔서 조회할 때
    SELECT 열1, 열2, ... 열n
      FROM 테이블명;

    -- 조건 필터링(필요한 행, 레코드)만 조회할 때
    SELECT *|열이름 나열
      FROM 테이블명
     WHERE 조건...;

    -- 정렬하고 싶을 때
    -- ASCeding(오름차순) | DESCending(내림차순)
    -- ASC는 기본이므로 생략가능
    SELECT *|열이름 나열
      FROM 테이블명
     WHERE 조건...  -- 옵션(필수 X)
     ORDER BY 열1, 열2 ASC|DESC;
    ```

## 2일차

### 도커 사용하는 이유

- 설치 편의성 - 이미지만 있으면 컨테이너로 실행하는데 수십초에 불과함. 설치 설정 불필요
- 환경격차 문제해결 - OS단의 설정까지 건드려야하는 문제를 없애고, 간단하게 서비스를 실행 가능
- 서버비용 절감 - 새로운 서비스를 할 때마다 하드웨어 서버를 구매, 설정할 필요 없음
- OS에 독립적 - 새로운 서비스의 운영OS에 따라 OS를 새로 설치할 필요없음
- 가상머신보다 빠름 - VMWare, VirtualBox와 같은 가상OS 머신보다 실행속도가 빠름. 필요없는 기능 제거, 용량 축소

### AI시대 PostgreSQL 학습

- DB시장에서 Oracle, MySQL, SQLServer 다음 PostgreSQL이 4위
- AI시대에 더 비중이 오름
- 나중에 학습할 것

### DBeaver 접속설정 다시

- Public Key Retrieval is not allowed 라는 경고메시지로 접속 불가할 때

    ![alt text](image-13.png)

- Driver properties 탭 `allowPublicKeyRetrieval` 키를 `true`로 변경

    ![alt text](image-14.png)

### SELECT 실습

#### 기본 문법

- 기본 문법 - [쿼리](./day02/1.SELECT기본.sql)

    ```sql
    SELECT ALL|DISTINCT 컬럼1, ...
      FROM 테이블명
     WHERE 필터링 조건
     GROUP BY 그루핑 컬럼1, 컬럼2, ...
    HAVING 집계함수 필터링 조건
     ORDER BY 컬럼1, 컬럼2 ASC|DESC;
    ```

#### 필터링

- WHERE절 - 전체 데이터에서 필요한 것만 필터링

    - 비교 : =(같다), <>(같지 않다), !=(DB종류별로 다름), <, >, <=, >=

    - 범위 : BETWEEN a AND b, `초과, 미만은 사용불가`, `날짜는 조심`할 것!
        - price BETWEEN 10000 AND 20000

    - 집합 : IN, NOT IN
        - price IN (10000, 20000, 25000) -- 가격이 1만, 2만, 2만5천에 속하는 데이터
        - price NOT IN (10000, 20000) -- 가격이 1만, 2만을 제외한 나머지 데이터

    - 패턴 : LIKE (문자열만), %, _
        - bookname LIKE '축구%' -- 책제목 중 축구로 시작하는 책 모두

    - NULL : 데이터가 없는 것, 입력되지 않은 것, =로 비교하지 X! ~~where price = null~~
        - price IS NULL, price IS NOT NULL

    - 복합 : AND(C++ &&와 동일), OR(C++ ||), NOT(C++ !)로 비교를 조합
        - (price < 20000) AND (bookname LIKE '축구의%')

- ORDER BY - 정렬 ASC(오름차순), DESC(내림차순)

#### 별명

- Alias - 별명으로 컬럼명, 테이블명 등 원래의 이름을 바꿔쓰고 싶을 때 AS 사용
    - "" 쌍따옴표로 별명을 지정하는 것을 추천. (스페이스 사용 등의 목적 때문에)

#### 그룹화 및 집계함수

- GROUP BY, 집계(통계)함수 - DB를 사용하는 가장 큰 목적 중 하나
    
    - SUM() : 총합, 숫자 컬럼만
    - COUNT() : 총 개수, 컬럼 대신 * 가능
    - MIN() : 최솟값, 숫자 컬럼만
    - MAX() : 최댓값, 숫자 컬럼만
    - AVG() : 평균값, 숫자 컬럼만
    - STD() : 표준편차, 숫자 컬럼만

- HAVING - 일반 필터링은 WHERE 절로, `집계함수 필터링은 HAVING`절로

- GROUP BY, HAVING `주의사항`
    - GROUP BY에 포함되지 않은 컬럼은 SELECT에 사용할 수 없음!
    - 집계함수 외 일반 컬럼은 SELECT와 GROUP BY를 일치시킬 것
    - HAVING 절에는 집계함수 필터링 포함
    - WHERE 절에 집계함수 사용불가!
    - SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY 순으로 기억

#### 조인

- JOIN - 관계형 DB의 핵심기능 - [쿼리](./day02/3.JOIN.sql)
    - 두 개 이상의 테이블을 합쳐서 하나의 테이블처럼 보여주는 기법

    ![alt text](image-15.png)

- JOIN 종류 - 종류는 많으나 3가지만 알면 됨
    - INNER JOIN(내부 조인) - 조인 중에서 가장 간단한 조인. 컬럼이 일치하는 데이터만 조회. 기준 테이블 없음. 조인되는 테이블 간의 관계 확인
    - OUTER JOIN(외부 조인) - 한 테이블 기준으로 데이터가 일치하지 않는 데이터까지 나오도록 조회하는 조인
        - LEFT OUTER JOIN - 두 개의 테이블 중 앞쪽 테이블 기준
        - RIGHT OUTER JOIN - 두 개의 테이블 중 뒤쪽 테이블 기준

#### 서브쿼리(부속질의)

- SubQuery - 쿼리 내부에 포함되는 하위쿼리. 항상 소괄호() 내에 작성 - [쿼리](./day02/4.SUBQUERY.sql)
    - 서브쿼리는 소괄호 안의 쿼리부터 먼저 작성
    - 메인쿼리 - 소괄호 밖의 쿼리
    - 서브쿼리 - 소괄호 안의 쿼리
    - 대부분이 조인으로 변경 가능
    - 조인이 가지고 있는 성능 개선의 특징을 사용못하기 때문에 속도저하가 발생할 가능성 높음
    - 조인을 많이 사용한다면, 서브쿼리는 필요할 때만 사용

## 3일차

### SELECT 실습

- DB 기본타입 - 문자열, 숫자(정수, 실수), 날짜시간

#### 서브쿼리 계속

- 서브쿼리 종류 - [쿼리](./day03/1.SUBQUERY.sql)
    - WHERE절 서브쿼리
    - FROM절 서브쿼리
    - SELECT절 서브쿼리

#### 집합연산

- 두 테이블 합치기 - [쿼리](./day03/2.UNION.sql)
    - UNION - 중복제거 합집합
    - UNION ALL - 중복표시 합집합

#### GROUP BY 추가 기능

- GROUP BY 컬럼 WITH ROLLUP - 전체 합산 추출 - [쿼리](./day03/3.ROLLUP.sql)
    - ROLLUP을 안쓰면 쿼리가 아주 길어짐

### DML 기타

- [쿼리](./day03/4.DML기타.sql)
- DML 중에서 직접적인 트랜잭션 영향을 받지 않는 것은 SELECT 뿐

#### INSERT

- 테이블에 데이터를 삽입하는 쿼리
- 트랜잭션의 영향을 받음

    ```sql
    INSERT INTO 테이블명 (컬럼1, ... 컬럼n )
    VALUES (컬럼1 값, ... 컬럼n 값);
    ```

- UPDATE나 DELETE와 달리 큰 문제가 발생하지 않음
- 잘못 입려되면 지우면 됨

#### UPDATE

- 테이블에 존재하는 데이터를 수정하는 쿼리
- 트랜잭션의 영향을 받음
- 수정은 매우 신중

    ```sql
    UPDATE 테이블명
       SET 변경 컬럼1 = 변경 값1
         , 변경 컬럼2 = 변경 값2
         , ...
         , 변경 컬럼n = 변경 값n
     WHERE 구분 컬럼 = 구분 값;
    ```

#### DELETE

- 테이블에 존재하는 데이터를 삭제하는 쿼리
- 트랜잭션의 영향을 받음
- 삭제는 매우 신중

    ```sql
    DELETE FROM 테이블명
     WHERE 구분 컬럼 = 구분 값;
    ```

#### 트랜잭션 처리

- UPDATE, DELETE, (INSERT 포함) 처리오류가 발생하면 복구할 수 있는 기능 존재
- 8장에서 다룰 예정

### DDL

- 객체 생성하고 수정, 삭제하는 기능을 하는 SQL언어

#### MySQL 데이터타입

- `BOOL` - true/false
- TINYINT, SMALLINT - 1byte(255개), 2byte
    - `TINYINT(1) `- 1/0
- `INT` - 4byte(가장 기본)
- `BIGINT` - 8byte
- FLOAT - 4byte, 소수점
- DOUBLE - 8byte, 소수점, 예전에 많이 사용
- `DECIMAL(m, n)` - m 전체 65자리수, n 소수점 최대 30자리수
    - 정수가 35자리, 소수점 30자리인 아주 큰 수
    - 현재 가장 많이 사용되는 숫자타입
- DATE - 날짜만, 2026-03-17
- `DATETIME` - 날짜와 시간 모두, 2026-03-17 16:28:56.092
- CHAR(n) - 고정길이 문자열, n만큼 길이 지정
    - CHAR(10)에 'Hello'입력하면 'Hello     '로 저장
    - 나머지 5자리 스페이스로 채움
    - 주민번호, 공통코드처럼 정확한 길이 입력 필요할 때
- VARCHAR(n) - 가변길이 문자열, n만큼 길이 지정
    - VARCHAR(10)은 'Hello' 로 저장. 나머지 5자리는 없앰
    - 길이를 넘어서는 문자열은 입력되지 않음(잘림)
    - CHAR, VARCHAR는 길이를 여유있게 설정
- `TEXT`, LONGTEXT - 아주 긴 문자열, 2 ~ 4GB
- `BLOB`, LONGBLOB - 바이너리로 저장되는 큰 데이터, 2 ~ 4GB


#### CREATE

- DB객체를 생성하는 쿼리 - [쿼리](./day03/5.DDL.sql)
- 데이터베이스, 테이블, 뷰, 인덱스 등 주요 객체 생성 가능

    ```sql
    -- 테이블 생성
    CREATE TABLE 테이블명(
        컬럼1 이름 데이터타입 제약조건,
        컬럼2 이름 데이터타입 제약조건,
        ...
        컬럼n 이름 데이터타입 제약조건,
        [각 제약조건 독립적으로 작성]
    );

    -- 데이터베이스 생성
    CREATE DATEBASE 데이터베이스명;

    -- 사용자 생성
    CREATE USER 사용자명 IDENTIFIED BY 비번;

    -- ...
    ```

## 4일차

### MySQL 샘플DB

- 샘플DB
    - https://dev.mysql.com/doc/index-other.html?ref=dbwriter.io
    - https://www.mysqltutorial.org/getting-started-with-mysql/mysql-sample-database/

- `Sakila`(영화대여 DB) : [쿼리](./ref/sakila-schema-safe.sql)
    - Data : [쿼리](./ref/sakila-data.sql)

### DML 추가

- INSERT INTO 대량 삽입 - MySQL 방법 : [쿼리](./day04/1.INSERT추가.sql)

    ```sql
    INSERT INTO 테이블명 VALUES(컬럼1 값, 컬럼2 값, ..., 컬럼n 값),
    (컬럼1 값, 컬럼2 값, ..., 컬럼n 값),
    (컬럼1 값, 컬럼2 값, ..., 컬럼n 값),
    ...
    (컬럼1 값, 컬럼2 값, ..., 컬럼n 값);
    ```

- SELECT TOP 3
    - 전체 조회 수중에서 조건에 맞는 데이터 3개만 조회

### DDL 계속

#### 제약조건 개요

- 데이터베이스에 정확한 데이터가 들어갈 수 있도록, 테이블 각 컬럼별 입력가능한 데이터를 지정하는 것
- 무결성을 벗어나는 데이터는 못들어가도록 제약(제한)을 주는 것
- 종류 : `기본키(Primary Key)`, 단일(Unique), 널허용여부(Null), 체크(Check), 기본값(Default), `외래키(Foreign Key)`

#### CREATE 계속

- CREATE 구문 - [쿼리](./day04/2.CREATE.sql)
    - PRIMARY KEY (컬럼 1 또는 여러 개)
    - FOREIGN KEY (custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
        - REFERENCES : 참조하는 부모테이블과 PK컬럼
        - ON DELETE CASCADE : 무결성 유지를 위해서 부모 테이블의 해당 PK데이터를 삭제하면 자식테이블 관련 FK데이터도 같이 삭제하는 옵션
        - ON DELETE SET NULL : 부모 테이블의 PK값이 삭제되면, 자식테이블의 FK값은 NULL로 변경한다
        - ON UPDATE CASCADE|SET NULL : 수정할 때도 삭제 시와 유사한 처리 가능. 수정도 가능하지만, PK 수정이 거의 없기 때문에 많이 사용되지 않음

- AUTO_INCREMENT : 테이블에 데이터 삽입할 때 숫자타입 PK의 값을 자동 증가시켜서 만들어주는 기능
    - PK 컬럼은 INSERT 문에서 생략

#### ALTER

- ALTER - [쿼리](./day04/3.ALTER.sql)
    - 객체 수정, 테이블 외에서는 많이 사용안됨

    ```sql
    ALTER TABLE 테이블명
        [ADD 속성명 데이터타입]
        [DROP CULUMN 속성명]
        [MODIFY 속성명 데이터타입]
        [MODIFY 속성명 [NULL|NOT NULL]]
        [ADD PRIMARY KEY(컬럼명)]
        [[ADD|DROP] 제약조건명]
    ```

#### DROP

- DROP
    - 객체 삭제
    - 테이블에서는 관계를 맺고있는 자식테이블 먼저 삭제 후 부모테이블 삭제 가능

    ```sql
    DROP 객체 객체명
    ```

### 내장함수

- C, C++ 내장함수와 동일 - [쿼리](./day04/4.내장함수.sql)

### NULL과 NULL관련 함수

- 아직 지정되지 않은 값 - [쿼리](./day04/5.NULL.sql)
- '0', '', ' '과 다름
- C, C++의 '\0'과 동일한 의미
- 비교연산 불가(=, >, <, >=, <=, !=) 대신 IS, IS NOT만 사용 가능
- NULL값을 연산하면 결과도 NULL이 됨
    - NULL + 숫자 => NULL
    - 집계함수 계산 시 NULL 포함된 행은 집계에서 빠짐!

### 쿼리연습

- [쿼리](./day04/7.Sakila_practice.sql)

![sakila_erd](./sakila_erd.png)

## 5일차

### 쿼리연습

- [쿼리](./day05/1.Sakila_practice.sql)

### 뷰

- VIEW - [쿼리](./day05/2.VIEW.sql)
    - 편리성과 재사용성 : 일반 테이블을 사용하는 것처럼 사용하고, 여러 번 사용가능
    - 보안성 : 개인정보와 같은 민감한 데이터의 공개를 막을 수 있음
    - 독립성 : 일반 테이블처럼 사용. 사용자가 필요한 정보만 가공. 원본 테이블을 변경할 필요 없음

- VIEW 특징
    - 실제 데이터가 아님. 원본 데이터가 바뀌면 뷰 데이터도 갱신
    - 독립적인 인덱스 생성 어려움(속도개선 어려움)
    - 뷰이지만 데이터 INSERT, UPDATE 등이 가능
    - INSERT, UPDATE, DELETE는 거의 불가
    - 뷰는 보기위해서 생성하므로 SELECT 이외 DML은 거의 사용하지 않음

    ```sql
    -- 생성과 수정
    CREATE OR REPLACE VIEW 뷰이름 AS
    SELECT 구문;

    -- 삭제
    DROP VIEW 뷰이름;
    ```

### 인덱스

- INDEX - [쿼리](./day05/3.INDEX.sql)
    - 책 뒤편 찾아보기, 인덱스와 동일한 역할
    - 테이블에 하나 이상 설정가능(인덱스를 건다라고 부름)
    - 인덱스가 없으면 `Full Table Scan`, 인덱스가 있으면 `Index Range Scan` 으로 변경
    - 내부적으로 B-tree 자료구조 사용, $O(logN)$

    ```sql
    -- 인덱스 생성
    CREATE [UNIQUE] INDEX 인덱스명 ON 테이블명(컬럼명, ...[ASC|DESC]);

    -- 인덱스 삭제
    DROP INDEX 인덱스명 ON 테이블명;    
    ```

- 인덱스 종류
    - 기본키 인덱스 : Primary키에 자동으로 걸리는 인덱스. 클러스터 인덱스
    - UNIQUE 인덱스 : Unique 제약조건의 컬럼에 걸 수 있는 인덱스, NULL은 허용하는데 데이터 중복은 불가
    - 일반 인덱스 : 중복허용, 인덱스 효과가 미흡
    - 복합 인덱스 : 두 개 이상의 컬럼을 하나의 인덱스로 

- 인덱스 구분
    - 클러스터 인덱스 : 테이블당 하나만 생성. 데이터 자체가 정렬되는 것. 최초 PK나 PK가 없는 테이블에서는 첫번째 UNIQUE 인덱스
    - 넌클러스터 인덱스 : 여러개 가능. 인덱스가 데이터 따로 생성. 클러스터 인덱스 생성 후 모든 인덱스가 전부 넌클러스터 인덱스

- `인덱스 주의사항`
    - 인덱스를 생성한다고 무조건 속도가 빨라지는 것은 아님. 제대로 걸어야 함
    - WHERE절에 자주 사용되는 컬럼에 인덱스를 걸어야 함.(PK는 자동으로 인덱스 생성)
    - JOIN에 사용되는 FK에도 인덱스를 걸면 속도 개선
    - 단일 테이블에 인덱스를 너무 많이 걸면 반대로 속도가 느려짐(테이블 당 4개 정도 인덱스 권장)
    - 인덱스마다 ASC, DESC로 정렬해야하기 때문에 부가적인 처리가 많아짐
    - 자주 변경, 삭제되는 컬럼에 인덱스를 걸지말 것
    - 중복이 많이 되거나 NULL이 많은 컬럼은 인덱스효과 미비

### SELECT문 추가 기능

#### CTE

- Common Table Expression : 공통으로 쓸 수 있는 테이블 표현기법 - [쿼리](./day05/4.CTE.sql)
    - 여러곳에서 공통으로 사용할 임시 테이블형태 쿼리
    - 이름을 지정하는 임시 테이블
    - 쿼리를 깔끔하게 생성
    - 쿼리 실행동안 재사용
    - 가상데이터를 생성할 때

    ```sql
    WITH cte이름 AS (
        SELECT ...
    )
    SELECT *
      FROM cte이름
    ```

## 6일차

### 트랜잭션, 동시성제어

- TCL

### 보안 및 관리

#### 사용자

- DDL 일부

#### 권한

- DCL

### MySQL 프로그래밍

#### 프로시저

#### 함수

### C/C++에서 MySQL연동

#### MySQL Connector C/C++ 라이브러리

### 데이터베이스 모델링

#### ERD 작성

- 정규화, 반정규화, 개념/논리/물리다이어그램