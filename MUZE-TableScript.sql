CREATE TABLE MEMBER (
	MEMBER_NO	NUMBER	NOT NULL,
	MEMBER_ID	VARCHAR2(20)	NOT NULL,
	MEMBER_PASSWORD	VARCHAR2(50)	NOT NULL,
	MEMBER_ROLE	VARCHAR2(20)	DEFAULT 'MEMBER_ROLE_USER' NOT NULL	,
	MEMBER_NAME	VARCHAR2(20)	NOT NULL,
	MEMBER_PHONE_NUMBER	VARCHAR2(20)	NOT NULL,
	MEMBER_EMAIL	VARCHAR2(30)	NOT NULL,
	MEMBER_ADDRESS	VARCHAR2(256)	NOT NULL,
	POINT	NUMBER	DEFAULT 0 NOT NULL,
	ENROLL_DATE	DATE	DEFAULT SYSDATE NOT NULL	,
	ISRESIGNED	CHAR(1)	DEFAULT 'N' NULL	
);

CREATE TABLE EVENT (
	MEMBER_NO	NUMBER	NOT NULL,
	EV_ATTEND_DATE	DATE	NOT NULL
);

CREATE TABLE ORDERS (
	ORDER_NO	NUMBER	NOT NULL,
	PRO_NO	NUMBER	NOT NULL,
	ORDER_AMOUNT	NUMBER	NOT NULL,
	ORDER_STATUS	VARCHAR2(20)	NOT NULL,
	PAYMENT_TYPE	VARCHAR2(20)	NOT NULL,
	MEMBER_NAME	VARCHAR2(20)	NOT NULL,
	MEMBER_ADDRESS	VARCHAR2(256)	NOT NULL,
	MEMBER_PHONE_NUMBER	NUMBER(20)	NOT NULL,
	POINT_NO	NUMBER	NOT NULL,
	MEMBER_ACC_NUM	NUMBER	NOT NULL,
	SELLER_ACC_NUM	NUMBER	NOT NULL,
	ORDER_DATE	DATE	NOT NULL,
	MEMBER_NO	NUMBER	NOT NULL
);

CREATE TABLE CART (
	MEMBER_NO	NUMBER	NOT NULL,
	PRO_NO	NUMBER	NOT NULL,
	CART_QUANTITY	NUMBER	NOT NULL
);

CREATE TABLE PRODUCT (
	PRO_NO	NUMBER	NOT NULL,
	PRO_NAME	VARCHAR(20)	NOT NULL,
	PRO_SIZE	VARCHAR(20)	NOT NULL,
	PRO_PRICE	NUMBER	NOT NULL,
	PRO_QUENTITY	NUMBER	NOT NULL,
	PRO_IMG	VARCHAR2(100)	NOT NULL,
	PRO_ARTIST_ID	VARCHAR2(20)	NOT NULL,
	PRO_REG_DATE	DATE	NOT NULL,
	PRO_DESCRIPTION	VARCHAR2(400)	NULL,
	PRO_TYPE	VARCHAR2(20)	NOT NULL
);

CREATE TABLE ARTIST_DETAIL (
	ARTIST_NO	NUMBER	NOT NULL,
	ARTIST_IMG	VARCHAR2(100)	NOT NULL,
	ARTIST_INTRODUCE	VARCHAR2(400)	NOT NULL,
	BUS_NAME	VARCHAR2(20)	NULL,
	BUS_LICENCE	NUMBER	NULL
);

CREATE TABLE BOARD (
	BRD_NO	VARCHAR2(10)	NOT NULL,
	BRD_TITLE	VARCHAR2(100)	NOT NULL,
	BRD_CONTENT	VARCHAR(400)	NOT NULL,
	BRD_DATE	DATE	NOT NULL,
	BRD_READCOUNT	NUMBER	NOT NULL,
	BRD_WRITER_NO	NUMBER	NOT NULL,
	BRD_PRO_NO	NUMBER	NULL,
	BRD_CATEGORY	VARCHAR2(20)	NULL,
	BRD_REP_CONTENT	VARCHAR2(200)	NULL,
	BRD_TYPE	VARCHAR2(10)	NOT NULL,
	BRD_STATUS	VARCHAR2(1)	NOT NULL,
	BRD_ORIGINALFILENAME	VARCHAR2(100)	NULL,
	BRD_RENAMEDFILENAME	VARCHAR2(100)	NULL
);

CREATE TABLE COMMENTS (
	COMMENTS_NO	NUMBER	NOT NULL,
	COMMENTS_CONTENT	VARCHAR2(100)	NOT NULL,
	COMMENTS_DATE	DATE	NOT NULL,
	BRD_NO	NUMBER	NOT NULL,
	COMMENTS_WRITER_NO	NUMBER	NOT NULL,
	COMMENTS_STATUS	VARCHAR2(1)	NOT NULL
);

CREATE TABLE ADMIN (
	NUM_VISIOTRS	NUMBER	NOT NULL,
	VISIT_DATE	DATE	NOT NULL
);

CREATE TABLE MILEAGE (
	POINT_NO	NUMBER	NOT NULL,
	MEMBER_NO	NUMBER	NOT NULL,
	POINT_PROCESS	NUMBER	NULL,
	POINT_ROUTE	VARCHAR2(20)	NULL,
	POINT_DATE	DATE	NULL,
	POINT_IN_OUT	VARCHAR(3)	NOT NULL
);

ALTER TABLE MILEAGE ADD POINT_BEFORE NUMBER;
ALTER TABLE MILEAGE ADD POINT_AFTER NUMBER;

CREATE TABLE BANK_ACCOUNT (
	MEMBER_ACC_NUM	NUMBER	NOT NULL,
	ACC_BAL	NUMBER	NOT NULL,
	MEMBER_NO	NUMBER	NOT NULL,
	MEMBER_ROLE	VARCHAR2(20)	NULL,
	MEMBER_ACC_NAME	VARCHAR(20)	NOT NULL
);

CREATE TABLE BANK_ACCOUNT_BAL (
	MEMBER_ACC_NUM	NUMBER	NOT NULL,
	ACC_IN_OUT	VARCHAR(3)	NOT NULL,
	ACC_USAGE	NUMBER	NOT NULL,
	ACC_BAL	NUMBER	NOT NULL,
	ACC_DATE	DATE	NULL
);

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

ALTER TABLE ADMIN ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	NUM_VISIOTRS
);

ALTER TABLE MILEAGE ADD CONSTRAINT PK_MILEAGE PRIMARY KEY (
	POINT_NO
);

ALTER TABLE BANK_ACCOUNT ADD CONSTRAINT PK_BANK_ACCOUNT PRIMARY KEY (
	MEMBER_ACC_NUM
);

ALTER TABLE BANK_ACCOUNT_BAL ADD CONSTRAINT PK_BANK_ACCOUNT_BAL PRIMARY KEY (
	MEMBER_ACC_NUM
);

ALTER TABLE EVENT ADD CONSTRAINT PK_EVENT PRIMARY KEY (
    MEMBER_NO
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

ALTER TABLE BANK_ACCOUNT_BAL ADD CONSTRAINT FK_BANK_ACC_TO_BANK_ACC_BAL_1 FOREIGN KEY (
	MEMBER_ACC_NUM
)
REFERENCES BANK_ACCOUNT (
	MEMBER_ACC_NUM
);

ALTER TABLE MILEAGE ADD CONSTRAINT FK_MILEAGE FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (
    MEMBER_NO
);

ALTER TABLE EVENT ADD CONSTRAINT PK_EVENT FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (
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







