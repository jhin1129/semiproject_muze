CREATE TABLE MEMBER (
	MEMBER_NO	NUMBER	NOT NULL,
	MEMBER_ID	VARCHAR2(100)	NOT NULL,
	MEMBER_PASSWORD	VARCHAR2(50)	NOT NULL,
	MEMBER_ROLE	VARCHAR2(20)	DEFAULT 'MEMBER_ROLE_USER' NOT NULL	,
	MEMBER_NAME	VARCHAR2(20)	NOT NULL,
	MEMBER_PHONE_NUMBER	VARCHAR2(20)	NOT NULL,
	MEMBER_EMAIL	VARCHAR2(30)	NOT NULL,
	MEMBER_ADDRESS	VARCHAR2(256)	NOT NULL,
	POINT	NUMBER	DEFAULT 0 NULL,
	ENROLL_DATE	DATE	DEFAULT SYSDATE NOT NULL	,
	ISMEMBER	CHAR(1)	DEFAULT 'Y' NULL	
);

CREATE TABLE EVENT (
	MEMBER_NO	NUMBER	NOT NULL,
	EV_ATTEND_DATE	DATE	NOT NULL
);

CREATE TABLE ORDERS (
	ORDER_NO	NUMBER	NOT NULL,
	PRO_NO	NUMBER	NOT NULL,
	ORDER_DATE	DATE	NOT NULL,
	ORDER_AMOUNT	NUMBER	NOT NULL,
	MEMBER_NO	NUMBER	NOT NULL,
	BUY_NAME	VARCHAR2(20)	NOT NULL,
	BUY_ADDRESS VARCHAR2(256)	NOT NULL,
	BUY_PHONE	VARCHAR2(20)	NOT NULL,
	POINT_NO	NUMBER	NOT NULL
);

CREATE TABLE CART (
	MEMBER_NO	NUMBER	NOT NULL,
	PRO_NO	NUMBER	NOT NULL
);

CREATE TABLE PRODUCT (
	PRO_NO	NUMBER	NOT NULL,
	PRO_NAME	VARCHAR(40)	NOT NULL,
	PRO_SIZE	VARCHAR(20)	NOT NULL,
	PRO_PRICE	NUMBER	NOT NULL,
	PRO_QUANTITY	NUMBER	NOT NULL,
	PRO_IMG	VARCHAR2(100)	NOT NULL,
	PRO_ARTIST_NO	NUMBER	NOT NULL,
	PRO_REG_DATE	DATE	NOT NULL,
	PRO_DESCRIPTION	VARCHAR2(2000)	NULL,
	PRO_TYPE	VARCHAR2(20)	NOT NULL,
	PRO_STATUS	VARCHAR2(20)	NOT NULL
);

CREATE TABLE ARTIST_DETAIL (
	ARTIST_NO	NUMBER	NOT NULL,
	ARTIST_IMG	VARCHAR2(100)	NOT NULL,
	ARTIST_INTRODUCE	VARCHAR2(400)	NOT NULL,
	BUS_NAME	VARCHAR2(20)	NULL,
	BUS_LICENCE	NUMBER	NULL
);

CREATE TABLE BOARD (
	BRD_NO	NUMBER	NOT NULL,
	BRD_TITLE	VARCHAR2(100)	NOT NULL,
	BRD_CONTENT	VARCHAR(2000)	NOT NULL,
	BRD_DATE	DATE	NOT NULL,
	BRD_READCOUNT	NUMBER	NOT NULL,
	BRD_WRITER_NO	NUMBER	NOT NULL,
	BRD_PRO_NO	NUMBER	NULL,
	BRD_CATEGORY	VARCHAR2(20)	NULL,
	BRD_REP_CONTENT	VARCHAR2(400)	NULL,
	BRD_TYPE	VARCHAR2(10)	NOT NULL,
	BRD_STATUS	VARCHAR2(1)	NOT NULL,
	BRD_ORIGINALFILENAME	VARCHAR2(100)	NULL,
	BRD_RENAMEDFILENAME	VARCHAR2(100)	NULL,
	BRD_IMG		VARCHAR2(100)	NULL
);

CREATE TABLE COMMENTS (
	COMMENTS_NO	NUMBER	NOT NULL,
	COMMENTS_CONTENT	VARCHAR2(200)	NOT NULL,
	COMMENTS_DATE	DATE	NOT NULL,
	BRD_NO	NUMBER	NOT NULL,
	COMMENTS_WRITER_NO	NUMBER	NOT NULL,
	COMMENTS_STATUS	VARCHAR2(1)	NOT NULL
);


CREATE TABLE MILEAGE (
	POINT_NO NUMBER NOT NULL,
	MEMBER_NO NUMBER NOT NULL,
	POINT NUMBER NULL,
	POINT_ROUTE	VARCHAR2(20) NULL,
	POINT_DATE DATE NULL,
    POINT_IN_OUT VARCHAR(3) NULL, 
	POINT_CUR NUMBER	NULL
);

CREATE TABLE ORDER_STATUS (
	ORDER_NO NUMBER NOT NULL,
	ORDER_DATE DATE NOT NULL,
	ORDER_STATUS VARCHAR2(20) NULL,
	PRO_NO NUMBER NOT NULL,
	MEMBER_NO NUMBER NOT NULL
)

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	MEMBER_NO
);

ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDERS PRIMARY KEY (
	ORDER_NO,
	PRO_NO
);

ALTER TABLE CART ADD CONSTRAINT PK_CART PRIMARY KEY (
	MEMBER_NO,
	PRO_NO
);

ALTER TABLE PRODUCT ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	PRO_NO
);

ALTER TABLE ARTIST_DETAIL ADD CONSTRAINT PK_ARTIST_DETAIL PRIMARY KEY (
	ARTIST_NO
);

ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	BRD_NO
);

ALTER TABLE COMMENTS ADD CONSTRAINT PK_COMMENTS PRIMARY KEY (
	COMMENTS_NO
);

ALTER TABLE MILEAGE ADD CONSTRAINT PK_MILEAGE PRIMARY KEY (
	POINT_NO
);

ALTER TABLE ORDER_STATUS ADD CONSTRAINT PK_ORDER_STATUS PRIMARY KEY(
	ORDER_NO
);

ALTER TABLE ORDERS ADD CONSTRAINT FK_PRODUCT_TO_ORDERS_1 FOREIGN KEY (
	PRO_NO
)
REFERENCES PRODUCT (
	PRO_NO
);

ALTER TABLE CART ADD CONSTRAINT FK_MEMBER_TO_CART_1 FOREIGN KEY (
	MEMBER_NO
)
REFERENCES MEMBER (
	MEMBER_NO
);

ALTER TABLE CART ADD CONSTRAINT FK_PRODUCT_TO_CART_1 FOREIGN KEY (
	PRO_NO
)
REFERENCES PRODUCT (
	PRO_NO
);

ALTER TABLE ARTIST_DETAIL ADD CONSTRAINT FK_MEMBER_TO_ARTIST_DETAIL_1 FOREIGN KEY (
	ARTIST_NO
)
REFERENCES MEMBER (
	MEMBER_NO
);

ALTER TABLE PRODUCT ADD CONSTRAINT FK_MEMBER_TO_PRODUCT FOREIGN KEY (
    PRO_ARTIST_NO 
) REFERENCES MEMBER (
    MEMBER_NO );

ALTER TABLE MILEAGE ADD CONSTRAINT FK_MILEAGE FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (
    MEMBER_NO
);

--게시판 시퀸스 생성
CREATE SEQUENCE SEQ_BOARD_NO;
--게시판 시퀸스 삭제
DROP SEQUENCE SEQ_BOARD_NO;
--자유게시글 테스트값
BEGIN
    FOR N IN 1..51
    LOOP
        INSERT INTO BOARD(BRD_NO, BRD_TITLE, BRD_CONTENT, BRD_DATE, BRD_READCOUNT, BRD_WRITER_NO, BRD_TYPE, BRD_STATUS)
        VALUES( 
            SEQ_BOARD_NO.NEXTVAL, 
            '테스트를 위한 자유게시글 ' || SEQ_BOARD_NO.CURRVAL, 
            '테스트를 위한 자유게시글 내용' || SEQ_BOARD_NO.CURRVAL, 
            SYSDATE, 
            0, 
            TRUNC(DBMS_RANDOM.VALUE(1, 13)),
            'FREE',
            'Y'
            );
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
--리뷰게시글 테스트값
BEGIN
    FOR N IN 1..51
    LOOP
        INSERT INTO BOARD(BRD_NO, BRD_TITLE, BRD_CONTENT, BRD_DATE, BRD_READCOUNT, BRD_WRITER_NO, BRD_PRO_NO, BRD_TYPE, BRD_STATUS)
        VALUES( 
            SEQ_BOARD_NO.NEXTVAL, 
            '테스트를 위한 리뷰게시글 ' || SEQ_BOARD_NO.CURRVAL, 
            '테스트를 위한 리뷰게시글 내용' || SEQ_BOARD_NO.CURRVAL, 
            SYSDATE, 
            0, 
            TRUNC(DBMS_RANDOM.VALUE(6, 13)),
            TRUNC(DBMS_RANDOM.VALUE(1, 11)),           
            'REVIEW',
            'Y'
            );
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
--QNA게시글 테스트값
BEGIN
    FOR N IN 1..51
    LOOP
        INSERT INTO BOARD(BRD_NO, BRD_TITLE, BRD_CONTENT, BRD_DATE, BRD_READCOUNT, BRD_WRITER_NO, BRD_TYPE, BRD_STATUS)
        VALUES( 
            SEQ_BOARD_NO.NEXTVAL, 
            '테스트를 위한 QNA게시글 제목 ' || SEQ_BOARD_NO.CURRVAL, 
            '테스트를 위한 QNA게시글 내용' || SEQ_BOARD_NO.CURRVAL, 
            SYSDATE, 
            0, 
            TRUNC(DBMS_RANDOM.VALUE(2, 13)),
            'QNA',
            'Y'
            );
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;

UPDATE BOARD SET BRD_CATEGORY = '상품' WHERE MOD(BRD_NO,7) = 0 AND BRD_TYPE='QNA';
UPDATE BOARD SET BRD_CATEGORY = '주문/결제' WHERE MOD(BRD_NO,7) = 1 AND BRD_TYPE='QNA';
UPDATE BOARD SET BRD_CATEGORY = '배송' WHERE MOD(BRD_NO,7) = 2 AND BRD_TYPE='QNA';
UPDATE BOARD SET BRD_CATEGORY = '반품/환불' WHERE MOD(BRD_NO,7) = 3 AND BRD_TYPE='QNA';
UPDATE BOARD SET BRD_CATEGORY = '이벤트' WHERE MOD(BRD_NO,7) = 4 AND BRD_TYPE='QNA';
UPDATE BOARD SET BRD_CATEGORY = '회원/정보관리' WHERE MOD(BRD_NO,7) = 5 AND BRD_TYPE='QNA';
UPDATE BOARD SET BRD_CATEGORY = '기타' WHERE MOD(BRD_NO,7) = 6 AND BRD_TYPE='QNA';

UPDATE BOARD SET BRD_REP_CONTENT = '답변이 있는 QNA입니다' WHERE BRD_CATEGORY IN('상품', '배송');

--FAQ게시글 테스트값
BEGIN
    FOR N IN 1..51
    LOOP
        INSERT INTO BOARD(BRD_NO, BRD_TITLE, BRD_CONTENT, BRD_DATE, BRD_READCOUNT, BRD_WRITER_NO, BRD_TYPE, BRD_STATUS)
        VALUES( 
            SEQ_BOARD_NO.NEXTVAL, 
            '테스트를 위한 FAQ게시글 제목 ' || SEQ_BOARD_NO.CURRVAL, 
            '테스트를 위한 FAQ게시글 내용' || SEQ_BOARD_NO.CURRVAL, 
            SYSDATE, 
            0, 
            TRUNC(DBMS_RANDOM.VALUE(2, 13)),
            'FAQ',
            'Y'
            );
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;

UPDATE BOARD SET BRD_CATEGORY = '상품' WHERE MOD(BRD_NO,7) = 0 AND BRD_TYPE='FAQ';
UPDATE BOARD SET BRD_CATEGORY = '주문/결제' WHERE MOD(BRD_NO,7) = 1 AND BRD_TYPE='FAQ';
UPDATE BOARD SET BRD_CATEGORY = '배송' WHERE MOD(BRD_NO,7) = 2 AND BRD_TYPE='FAQ';
UPDATE BOARD SET BRD_CATEGORY = '반품/환불' WHERE MOD(BRD_NO,7) = 3 AND BRD_TYPE='FAQ';
UPDATE BOARD SET BRD_CATEGORY = '이벤트' WHERE MOD(BRD_NO,7) = 4 AND BRD_TYPE='FAQ';
UPDATE BOARD SET BRD_CATEGORY = '회원/정보관리' WHERE MOD(BRD_NO,7) = 5 AND BRD_TYPE='FAQ';
UPDATE BOARD SET BRD_CATEGORY = '기타' WHERE MOD(BRD_NO,7) = 6 AND BRD_TYPE='FAQ';

UPDATE BOARD SET BRD_REP_CONTENT = '답변이 있는 FAQ입니다' WHERE BRD_CATEGORY IN('상품', '배송');



--댓글 시퀸스 생성
CREATE SEQUENCE SEQ_COMMENTS_NO;
--댓글 시퀸스 삭제
DROP SEQUENCE SEQ_COMMENTS_NO;
--댓글 테스트값
BEGIN
    FOR N IN 1..51
    LOOP
        INSERT INTO COMMENTS
        VALUES( 
            SEQ_COMMENTS_NO.NEXTVAL, 
            '테스트를 위한 댓글 내용' || SEQ_COMMENTS_NO.CURRVAL, 
            SYSDATE,
            TRUNC(DBMS_RANDOM.VALUE(1, 52)),
            TRUNC(DBMS_RANDOM.VALUE(1, 13)),
            'Y'
            );
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;

-- 포인트 번호 시퀀스 생성
CREATE SEQUENCE SEQ_POINT
START WITH 1
INCREMENT BY 1
MAXVALUE 10000;

-- BOARD 테이블 COMMENT 입력
COMMENT ON COLUMN BOARD.BRD_NO IS '게시글번호';
COMMENT ON COLUMN BOARD.BRD_TITLE IS '제목';
COMMENT ON COLUMN BOARD.BRD_CONTENT IS '내용';
COMMENT ON COLUMN BOARD.BRD_DATE IS '작성일자';
COMMENT ON COLUMN BOARD.BRD_READCOUNT IS '조회수';
COMMENT ON COLUMN BOARD.BRD_WRITER_NO IS '작성자';
COMMENT ON COLUMN BOARD.BRD_PRO_NO IS '작품코드';
COMMENT ON COLUMN BOARD.BRD_CATEGORY IS '카테고리';
COMMENT ON COLUMN BOARD.BRD_REP_CONTENT IS '답변내용';
COMMENT ON COLUMN BOARD.BRD_TYPE IS '게시글타입';
COMMENT ON COLUMN BOARD.BRD_STATUS IS '상태';
COMMENT ON COLUMN BOARD.BRD_ORIGINALFILENAME IS '첨부파일원래이름';
COMMENT ON COLUMN BOARD.BRD_RENAMEDFILENAME IS '첨부파일변경이름';

COMMENT ON COLUMN MILEAGE.POINT_NO IS '포인트 시퀀스';
COMMENT ON COLUMN MILEAGE.MEMBER_NO IS '멤버 번호';
COMMENT ON COLUMN MILEAGE.POINT IS '포인트';
COMMENT ON COLUMN MILEAGE.POINT_ROUTE IS '포인트 경로';
COMMENT ON COLUMN MILEAGE.POINT_DATE IS '포인트 처리일';
COMMENT ON COLUMN MILEAGE.POINT_IN_OUT IS '포인트 증감';
COMMENT ON COLUMN MILEAGE.POINT_CUR IS '현재 포인트';


-- MEMBER 테이블 comment
COMMENT ON COLUMN MEMBER.MEMBER_NO IS '유저번호';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PASSWORD IS '비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_ROLE IS '유저타입';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '이름';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE_NUMBER IS '전화번호';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.POINT IS '마일리지';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.ISRESIGNED IS '회원여부(Y/N)';

ALTER TABLE MEMBER MODIFY MEMBER_PHONE_NUMBER NULL;
ALTER TABLE MEMBER MODIFY MEMBER_EMAIL NULL;
ALTER TABLE MEMBER MODIFY MEMBER_ADDRESS NULL;
ALTER TABLE MEMBER MODIFY POINT NULL;
ALTER TABLE MEMBER MODIFY ENROLL_DATE NULL;

-- MEMBER 테이블명 변경
ALTER TABLE MEMBER RENAME COLUMN ISRESIGNED TO ISMEMBER;
ALTER TABLE MEMBER MODIFY (ISMEMBER DEFAULT 'Y');

-- MEMBER 시퀀스 추가
CREATE SEQUENCE SEQ_MEMBER;

-- MEMBER 테이블 가상 데이터
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'admin','1234','MEMBER_ROLE_ADMIN','관리자',DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'artist1','1234','MEMBER_ROLE_ARTIST','아티스트1','01023490833','artist1@gmail.com','경기도 군포시 산본동',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'artist2','1234','MEMBER_ROLE_ARTIST','아티스트2','01098912437','artist2@gmail.com','경기도 고양시 일산동구',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'artist3','1234','MEMBER_ROLE_ARTIST','아티스트3','01045962112','artist3@gmail.com','경기도 광주시',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'artist4','1234','MEMBER_ROLE_ARTIST','아티스트4','01017784459','artist4@gmail.com','경기도 용인시 수지구',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user1','PcfxdmlgVIL',DEFAULT,'서가람','01078546353','garam@gmail.com','김해시 내동',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user2','xcPsjcYva3T',DEFAULT,'이하은','01048471153','haeun@gmail.com','경기도 안양시',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user3','2UvYROwhSI5',DEFAULT,'정동섭','01098384766','dongseob@gmail.com','의정부시 호원동',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user4','eEyPmRzLINp',DEFAULT,'이민형','01038472634','minhyeong@gmail.com','서울시 관악구',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user5','JbLVutP1dNv',DEFAULT,'김보람','01095847361','boram@gmail.com','대전시 유성구',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user6','7tZ1mK6lcAy',DEFAULT,'성빛나','01052346255','bitna@gmail.com','전주시 덕진구',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user7','lGOAZajsMX2',DEFAULT,'최상호','01009276112','sangho@gmail.com','서울시 용산구',DEFAULT,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'uiw6unoh','1224',DEFAULT,'신영민','01012341234','uiw6unoh@naver.com','경기도 고양시',DEFAULT,DEFAULT,DEFAULT);

-- ARIST_DETAIL 테이블 comment
COMMENT ON COLUMN ARTIST_DETAIL.ARTIST_NO IS '유저번호';
COMMENT ON COLUMN ARTIST_DETAIL.ARTIST_IMG IS '이미지';
COMMENT ON COLUMN ARTIST_DETAIL.ARTIST_INTRODUCE IS '소개글';
COMMENT ON COLUMN ARTIST_DETAIL.BUS_NAME IS '상호';
COMMENT ON COLUMN ARTIST_DETAIL.BUS_LICENCE IS '사업자번호';

-- ARIST_DETAIL 테이블명 변경
ALTER TABLE ARTIST_DETAIL RENAME COLUMN BUS_LICENCE TO BUS_LICENSE;

-- ARIST_DETAIL 테이블 가상 데이터
INSERT INTO ARTIST_DETAIL VALUES('2', './artistImage/JeffKoons.png', '아티스트1 테스트용', '뮤지엄 산', '2148509363');
INSERT INTO ARTIST_DETAIL VALUES('3', './artistImage/YenerTorun.jpg', '아티스트2 테스트용', '갤러리 길', '7062001181');
INSERT INTO ARTIST_DETAIL VALUES('4', './artistImage/magritte.png', '아티스트3 테스트용', 'gallery 686', '2152427247');
INSERT INTO ARTIST_DETAIL VALUES('5', './artistImage/ilya.png', '아티스트4 테스트용', 'Asan Gallery', '7138102189');