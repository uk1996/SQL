DROP DATABASE IF EXISTS market_db; -- 만약 market_db가 존재하면 우선 삭제한다.
CREATE DATABASE market_db;

USE market_db;
CREATE TABLE member -- 회원 테이블
( mem_id  		CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  mem_name    	VARCHAR(10) NOT NULL, -- 이름
  mem_number    INT NOT NULL,  -- 인원수
  addr	  		CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  phone1		CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2		CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 평균 키
  debut_date	DATE  -- 데뷔 일자
);
CREATE TABLE buy -- 구매 테이블
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   mem_id  	CHAR(8) NOT NULL, -- 아이디(FK)
   prod_name 	CHAR(6) NOT NULL, --  제품이름
   group_name 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 가격
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

-- member 테이블 모든 열 조회(2가지 방법)
USE market_db;
SELECT * FROM member;

SELECT * FROM market_db.member;

-- member 테이블 mem_name 조회
SELECT mem_name FROM member;

-- member 테이블 addr, debut_date, mem_name 조회
SELECT addr, debut_date, mem_name FROM member;

-- 열 이름 별칭 지정
SELECT addr, debut_date "데뷔 날짜", mem_name FROM member;

-- member 테이블에서 mem_name이 블랙핑크인 데이터 조회
SELECT * FROM member WHERE mem_name='블랙핑크';

-- member 테이블에서 member_number이 4인 데이터 조회
SELECT * FROM member WHERE mem_number=4;

-- member 테이블에서 height가 162 이하인 데이터 조회
SELECT * FROM member WHERE height <= 162;

-- member 테이블에서 height가 165 이상 이면서 mem_number가 6 초과인 데이터 조회
SELECT * FROM member WHERE height >= 165 AND mem_number > 6;

-- member 테이블에서 height가 165 이상 이거나 mem_number가 6 초과인 데이터 조회
SELECT * FROM member WHERE height >= 165 OR mem_number > 6;

-- member 테이블에서 height가 163~165인 회원 조회
SELECT * FROM member WHERE height >= 163 AND height <=165;
SELECT * FROM member WHERE height BETWEEN 163 AND 165;

-- 경기, 전남, 경남 중 한곳에 사는 회원 조회
SELECT * FROM member WHERE addr ='경기' OR addr ='전남' OR addr ='경남';
SELECT * FROM member WHERE addr in ('경기', '전남', '경남');

-- 이름의 첫글자가 '우'로 시작하는 회원 조회
SELECT * FROM member WHERE mem_name LIKE '우%';

-- 이름의 앞 두글자는 상관없고, 뒤는 '핑크'인 회원을 검색
SELECT * FROM member WHERE mem_name LIKE '__핑크';