USE market_db;

-- 정수 데이터 형식 확인용 테이블 만들기(UNSIGNED 지정시 범위가 0부터 시작)
CREATE TABLE int_check (
	tinyint_col TINYINT,
    smallint_col SMALLINT,
    int_col INT,
    bigint_col BIGINT
);

-- 각 타입에 맞는 최대 값 입력
INSERT INTO int_check (tinyint_col, smallint_col, int_col, bigint_col) VALUES (127, 32767, 2100000000, 9000000000000000000);

-- 최대 값 보다 큰 값 입력시 에러 확인
INSERT INTO int_check (tinyint_col, smallint_col, int_col, bigint_col) VALUES (128, 32768, 2100000001, 9000000000000000001);

-- netflix_db 만들기
CREATE DATABASE netflix_db;
USE netflix_db;

-- movie 테이블 만들기
CREATE TABLE movie (
	moive_id INT,
    movie_title CHAR(30), -- 고정 길이 문자열(최대 255자)
    movie_director VARCHAR(20), -- 가변 길이 문자열(최대 16383자)
    movie_star VARCHAR(20),
    movie_script LONGTEXT, -- 대량의 텍스트(최대 약 42억자 까지 지정 가능, ex> 영화 자막) / TEXT: 최대 65535자
    moive_film LONGBLOB -- BLOB: Binary Long Object => 글자가 아닌 이미지, 동영상등의 데이터
    -- LONGTEXT 및 LONGBLOB로 설정하면 각 데이터는 최대 4GB까지 입력할 수 있음.
);