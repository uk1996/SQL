-- 데이터베이스 목록 출력
SHOW DATABASES;

-- 'shop_db' DATABASE 생성
CREATE DATABASE shop_db;

-- shop_db 선택
USE shop_db;

-- 회원 테이블 생성
CREATE TABLE member (
member_id CHAR(8) NOT NULL,
member_name CHAR(5) NOT NULL,
member_addr CHAR(20),
PRIMARY KEY(member_id)
);

-- 제품 테이블 생성
CREATE TABLE product (
product_name CHAR(4) NOT NULL,
cost INT NOT NULL,
make_date DATE,
company CHAR(5),
amount INT NOT NULL,
PRIMARY KEY(product_name)
);

-- member table 데이터 입력
INSERT INTO member (member_id, member_name, member_addr) VALUE('tess', '나훈아', '경기 부천시 중동');
INSERT INTO member (member_id, member_name, member_addr) VALUE('hero', '임영웅', '서울 은평구 중산동');
INSERT INTO member (member_id, member_name, member_addr) VALUE('iyou', '아이유', '인천 남구 주안동');
INSERT INTO member (member_id, member_name, member_addr) VALUE('jyp','박진영', '경기 고향시 장항동');
INSERT INTO member (member_id, member_name, member_addr) VALUE('carry','머라이어', '미국 텍사스');

-- product table 데이터 입력
INSERT INTO product (product_name, cost, make_date, company, amount) VALUE('바나나', 1500, '2021-07-01', '델몬트', 17);
INSERT INTO product (product_name, cost, make_date, company, amount) VALUE('카스', 2500, '2022-03-01', 'OB', 3);
INSERT INTO product (product_name, cost, make_date, company, amount) VALUE('삼각김밥', 800, '2023-09-01', 'CJ', 22);


-- 데이터 수정
UPDATE member SET member_addr='영국 런던' WHERE member_id='carry';

-- 데이터 삭제
DELETE FROM member WHERE member_id='carry';

-- 회원 테이블의 모든행, 모든열 조회
SELECT * FROM member;

-- 회원 테이블의 이름과 주소만 조회
SELECT member_name, member_addr FROM member;
 
-- 이름이 아이유인 회원의 모든열을 조회
SELECT * FROM member WHERE member_name='아이유';

-- member 테이블의 member_name 열에 인덱스를 지정
CREATE INDEX idx_member_name ON member(member_name);

-- member 뷰 생성
CREATE VIEW member_view
AS
	SELECT * FROM member;
    
-- 스토어드 프로시저 생성
DELIMITER //
CREATE PROCEDURE myProc() -- 스토어드 프로시저 이름 지정
BEGIN
	SELECT * FROM member WHERE member_name = '나훈아';
    SELECT * FROM product WHERE product_name = '삼각김밥';
END //
DELIMITER ;

-- myProc 스토어드 프로시저 호출
CALL myProc();

-- myProc 스토어드 프로시저 삭제
DROP PROCEDURE myProc;