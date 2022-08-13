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
SELECT * FROM member WHERE addr IN ('경기', '전남', '경남');

-- 이름의 첫글자가 '우'로 시작하는 회원 조회
SELECT * FROM member WHERE mem_name LIKE '우%';

-- 이름의 앞 두글자는 상관없고, 뒤는 '핑크'인 회원을 검색
SELECT * FROM member WHERE mem_name LIKE '__핑크';

-- 서브 쿼리(에이핑크의 height보다 height큰 회원 검색)
SELECT mem_name, height FROM member 
	WHERE height > (SELECT height FROM member WHERE mem_name='에이핑크');
    
-- 데뷔일자가 빠른 순으로 출력
SELECT * FROM member
	ORDER BY debut_date;

-- 데뷔일자가 늦은 순으로 출력
SELECT * FROM member
	ORDER BY debut_Date DESC;

-- 키가 164 이상인 회원들을 키가 큰 순서대로 출력
SELECT * FROM member
	WHERE height >= 164
    ORDER BY height DESC;

-- 키가 164 이상인 회원들을 키가 큰 순서대로 출력,키가 같으면 데뷔일자가 빠른 순서로 출력
SELECT * FROM member
	WHERE height >= 164
    ORDER BY height DESC, debut_date ASC;
    
-- 회원테이블의 앞의 3건의 데이터만 출력
SELECT * FROM member
	LIMIT 3;
    
-- 데뷔일자가 빠른 회원 3건의 데이터 출력
SELECT * FROM member
	ORDER BY debut_date
    LIMIT 3;
    
-- 평균키가 큰순으로 정렬하여, 3번째 부터 2건만 조회
SELECT * FROM member
	ORDER BY height DESC
    LIMIT 3, 2;

-- 중복 데이터를 제거하여 주소를 출력
SELECT DISTINCT addr FROM member;

-- 각 회원별로 구매한 개수를 합쳐서 출력
SELECT mem_id "회원 아이디", SUM(amount) "총 구매 개수" 
	FROM buy GROUP BY mem_id;
    
-- 각 회원 별로 구매한 금액의 총합 출력
SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액" 
	FROM buy GROUP BY mem_id;

-- 각 회원이 한번 구매시 평균 몇 개를 구매했는지 출력
SELECT mem_id, AVG(amount) 
	FROM buy
	GROUP BY mem_id;
    
-- 연락처가 있는 회원의 수 출력
SELECT COUNT(phone1) "연락처가 있는 회원의 수" FROM member;

-- 총 구매 금액이 1000 이상인 회원을 검색 내림차순으로 정렬
SELECT mem_id, SUM(price*amount) "총 구매 금액" 
	FROM buy
    GROUP BY mem_id
    HAVING SUM(price*amount) > 1000
    ORDER BY SUM(price*amount) DESC;
    
-- toy 테이블 생성
CREATE TABLE toy
(toy_id INT NOT NULL PRIMARY KEY,
 toy_name CHAR(4) NOT NULL,
 price INT
);

-- toy 테이블에 데이터 삽입
INSERT INTO toy VALUES (1, '우디', 2500);

-- toy 테이블에 데이터 일부만 삽입
INSERT INTO toy (toy_id, toy_name) VALUES (2, '버즈');

-- toy 테이블에 열의 순서를 바꿔서 입력
INSERT INTO toy (toy_name, price, toy_id) VALUES ('레고', 10000, 3);

-- toy2 테이블 생성(AUTO_INCREMENT 사용)
CREATE TABLE toy2(
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_anme CHAR(4) NOT NULL,
    price INT
);

-- AUTO_INCREMENTT 확인
INSERT INTO toy2 VALUES (NULL, '레고', 2000);
INSERT INTO toy2 VALUES (NULL, '렉스', 1000);
INSERT INTO toy2 VALUES (NULL, '슬링키', 5000);
SELECT * FROM toy2;

-- 마지막 toy_id 확인
SELECT LAST_INSERT_ID();

-- AUTO_INCREMENT를 100부터 시작하도록 변경
ALTER TABLE toy2 AUTO_INCREMENT=100;
INSERT INTO toy2 VALUES (NULL, '에그', 2000);
SELECT * FROM toy2;

-- toy_id 가 3씩 증가하도록 변경
SET @@auto_increment_increment=3;

-- auto_increment_increment 값 확인
SELECT @@auto_increment_increment;

-- 전체 시스템 변수 확인하기
SHOW GLOBAL VARIABLES;

-- 데이터 3개를 한줄로 입력하기
INSERT INTO toy2 VALUES (NULL, '토마스', 3000), (NULL, '제임스', 1700), (NULL, '고든', 3000);
SELECT * FROM toy2;