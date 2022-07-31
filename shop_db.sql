-- 데이터베이스 목록 출력
SHOW DATABASES;

-- 'shop_db' DATABASE 생성
CREATE DATABASE shop_db;


-- 회원 테이블 생성
CREATE TABLE shop_db.member (
member_id CHAR(8) NOT NULL,
member_name CHAR(5) NOT NULL,
member_addr CHAR(20),
PRIMARY KEY(member_id)
);

-- 제품 테이블 생성
CREATE TABLE shop_db.product (
product_name CHAR(4) NOT NULL,
cost INT NOT NULL,
make_date DATE,
company CHAR(5),
amount INT NOT NULL,
PRIMARY KEY(product_name)
);

-- member table 데이터 입력
INSERT INTO shop_db.member (member_id, member_name, member_addr) VALUE('tess', '나훈아', '경기 부천시 중동');
INSERT INTO shop_db.member (member_id, member_name, member_addr) VALUE('hero', '임영웅', '서울 은평구 중산동');
INSERT INTO shop_db.member (member_id, member_name, member_addr) VALUE('iyou', '아이유', '인천 남구 주안동');
INSERT INTO shop_db.member (member_id, member_name, member_addr) VALUE('jyp','박진영', '경기 고향시 장항동');
INSERT INTO shop_db.member (member_id, member_name, member_addr) VALUE('carry','머라이어', '미국 텍사스');

-- product table 데이터 입력
INSERT INTO shop_db.product (product_name, cost, make_date, company, amount) VALUE('바나나', 1500, '2021-07-01', '델몬트', 17);
INSERT INTO shop_db.product (product_name, cost, make_date, company, amount) VALUE('카스', 2500, '2022-03-01', 'OB', 3);
INSERT INTO shop_db.product (product_name, cost, make_date, company, amount) VALUE('삼각김밥', 800, '2023-09-01', 'CJ', 22);


-- 데이터 수정
UPDATE shop_db.member SET member_addr='영국 런던' WHERE member_id='carry';

-- 데이터 삭제
DELETE FROM shop_db.member WHERE(member_id='carry');
 