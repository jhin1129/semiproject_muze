﻿CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"MEMBER_PASSWORD"	VARCHAR2(50)		NOT NULL,
	"MEMBER_ROLE"	VARCHAR2(20)	DEFAULT 'MEMBER_ROLE_USER'	NOT NULL,
	"MEMBER_NAME"	VARCHAR2(20)		NOT NULL,
	"MEMBER_PHONE_NUMBER"	VARCHAR2(20)		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(30)		NOT NULL,
	"MEMBER_ADDRESS"	VARCHAR2(256)		NOT NULL,
	"POINT"	NUMBER	DEFAULT 0	NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"ISMEMBER"	CHAR(1)	DEFAULT 'N'	NULL
);

CREATE TABLE "EVENT" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"EV_ATTEND_DATE"	DATE		NOT NULL
);

CREATE TABLE "ORDERS" (
	"ORDER_NO"	NUMBER		NOT NULL,
	"PRO_NO"	NUMBER		NOT NULL,
	"ORDER_DATE"	DATE		NOT NULL,
	"ORDER_AMOUNT"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BUY_NAME"	VARCHAR2(20)		NOT NULL,
	"BUY_ADDRESS"	VARCHAR2(256)		NOT NULL,
	"BUY_PHONE"	VARCHAR2(20)		NOT NULL,
	"POINT_NO"	NUMBER		NOT NULL
);

CREATE TABLE "CART" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"PRO_NO"	NUMBER		NOT NULL
);

CREATE TABLE "PRODUCT" (
	"PRO_NO"	NUMBER		NOT NULL,
	"PRO_NAME"	VARCHAR(40)		NOT NULL,
	"PRO_SIZE"	VARCHAR(20)		NOT NULL,
	"PRO_PRICE"	NUMBER		NOT NULL,
	"PRO_QUENTITY"	NUMBER		NOT NULL,
	"PRO_IMG"	VARCHAR2(100)		NOT NULL,
	"PRO_ARTIST_NO"	NUMBER		NOT NULL,
	"PRO_REG_DATE"	DATE		NOT NULL,
	"PRO_DESCRIPTION"	VARCHAR2(2000)		NULL,
	"PRO_TYPE"	VARCHAR2(20)		NOT NULL,
	"PRO_STATUS"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "ARTIST_DETAIL" (
	"ARTIST_NO"	NUMBER		NOT NULL,
	"ARTIST_IMG"	VARCHAR2(100)		NOT NULL,
	"ARTIST_INTRODUCE"	VARCHAR2(400)		NOT NULL,
	"BUS_NAME"	VARCHAR2(20)		NULL,
	"BUS_LICENSE"	NUMBER		NULL
);

CREATE TABLE "BOARD" (
	"BRD_NO"	NUMBER		NOT NULL,
	"BRD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BRD_CONTENT"	VARCHAR(2000)		NULL,
	"BRD_DATE"	DATE		NOT NULL,
	"BRD_READCOUNT"	NUMBER		NOT NULL,
	"BRD_WRITER_NO"	NUMBER		NOT NULL,
	"BRD_PRO_NO"	NUMBER		NULL,
	"BRD_CATEGORY"	VARCHAR2(20)		NULL,
	"BRD_REV_CONTENT"	VARCHAR2(400)		NULL,
	"BRD_TYPE"	VARCHAR2(10)		NOT NULL,
	"BRD_STATUS"	VARCHAR2(1)		NOT NULL,
	"BRD_ORIGINALFILENAME"	VARCHAR2(100)		NULL,
	"BRD_RENAMEDFILENAME"	VARCHAR2(100)		NULL,
	"BRD_IMG"	VARCHAR2(100)		NULL
);

CREATE TABLE "COMMENTS" (
	"COMMENTS_NO"	NUMBER		NOT NULL,
	"COMMENTS_CONTENT"	VARCHAR2(200)		NOT NULL,
	"COMMENTS_DATE"	DATE		NOT NULL,
	"BRD_NO"	NUMBER		NOT NULL,
	"COMMENTS_WRITER_NO"	NUMBER		NOT NULL,
	"COMMENTS_STATUS"	VARCHAR2(1)		NOT NULL
);

CREATE TABLE "MILEAGE" (
	"POINT_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"POINT"	NUMBER		NULL,
	"POINT_ROUTE"	VARCHAR2(20)		NULL,
	"POINT_DATE"	DATE		NULL,
	"POINT_IN_OUT"	VARCHAR(3)		NULL,
	"POINT_CUR"	NUMBER		NULL
);

CREATE TABLE "ORDER_STATUS" (
	"ORDER_NO"	NUMBER		NOT NULL,
	"ORDER_DATE"	DATE		NOT NULL,
	"ORDER_STATUS"	VARCHAR2(20)		NULL,
	"PRO_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "ORDERS" ADD CONSTRAINT "PK_ORDERS" PRIMARY KEY (
	"ORDER_NO",
	"PRO_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"MEMBER_NO",
	"PRO_NO"
);

ALTER TABLE "PRODUCT" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY (
	"PRO_NO"
);

ALTER TABLE "ARTIST_DETAIL" ADD CONSTRAINT "PK_ARTIST_DETAIL" PRIMARY KEY (
	"ARTIST_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BRD_NO"
);

ALTER TABLE "COMMENTS" ADD CONSTRAINT "PK_COMMENTS" PRIMARY KEY (
	"COMMENTS_NO"
);

ALTER TABLE "MILEAGE" ADD CONSTRAINT "PK_MILEAGE" PRIMARY KEY (
	"POINT_NO"
);

ALTER TABLE "ORDER_STATUS" ADD CONSTRAINT "PK_ORDER_STATUS" PRIMARY KEY (
	"ORDER_NO"
);

ALTER TABLE "ORDERS" ADD CONSTRAINT "FK_PRODUCT_TO_ORDERS_1" FOREIGN KEY (
	"PRO_NO"
)
REFERENCES "PRODUCT" (
	"PRO_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_MEMBER_TO_CART_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_PRODUCT_TO_CART_1" FOREIGN KEY (
	"PRO_NO"
)
REFERENCES "PRODUCT" (
	"PRO_NO"
);

ALTER TABLE "ARTIST_DETAIL" ADD CONSTRAINT "FK_MEMBER_TO_ARTIST_DETAIL_1" FOREIGN KEY (
	"ARTIST_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
