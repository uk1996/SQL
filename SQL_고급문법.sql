USE market_db;

-- 정수 데이터 형식 확인용 테이블 만들기
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