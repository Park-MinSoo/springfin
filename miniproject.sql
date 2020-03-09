-- smmember Table Create SQL
CREATE TABLE smmember
(
    sm_id         VARCHAR2(18)     NULL, 
    sm_pwd        VARCHAR2(12)     NULL, 
    nic           VARCHAR2(18)     NULL, 
    name          VARCHAR2(18)     NULL, 
    age           NUMBER(4)        NULL, 
    height        NUMBER(4)        NULL, 
    weight        NUMBER(4)        NULL, 
    gender        VARCHAR2(6)      NULL, 
    joindate      DATE             NULL, 
    stylepoint    number(16)       NULL, 
    address       VARCHAR2(120)    NULL, 
    CONSTRAINT SMMEMBER_PK PRIMARY KEY (sm_id)
)

-- smmember Table Create SQL
CREATE TABLE clothes
(
    cl_pid       VARCHAR2(18)     NOT NULL, 
    cl_type      VARCHAR2(18)     NULL, 
    cl_color     VARCHAR2(18)     NULL, 
    cl_tpo       VARCHAR2(18)     NULL, 
    cl_fabric    VARCHAR2(18)     NULL, 
    cl_uri       VARCHAR2(900)    NULL, 
    CONSTRAINT CLOTHES_PK PRIMARY KEY (cl_pid)
)

-- smmember Table Create SQL
CREATE TABLE board
(
    id           number(8)        NOT NULL, 
    writer       VARCHAR2(18)     NULL, 
    title        VARCHAR2(120)    NULL, 
    content      VARCHAR2(900)    NULL, 
    writedate    DATE             NULL, 
    cnt          number(8)        NULL, 
    tup          number(8)        NULL, 
    type         VARCHAR2(20)     NULL, 
    CONSTRAINT BOARD_PK PRIMARY KEY (id)
)
/

CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER board_AI_TRG
BEFORE INSERT ON board 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT board_SEQ.NEXTVAL
    INTO :NEW.id
    FROM DUAL;
END;
/

ALTER TABLE board
    ADD CONSTRAINT FK_board_writer_smmember_sm_id FOREIGN KEY (writer)
        REFERENCES smmember (sm_id)
/


-- smmember Table Create SQL
CREATE TABLE mycloset
(
    cst_sm_id    VARCHAR2(18)    NOT NULL, 
    cst_cl_id    VARCHAR2(18)    NULL, 
    CONSTRAINT MYCLOSET_PK PRIMARY KEY (cst_sm_id)
)
/

ALTER TABLE mycloset
    ADD CONSTRAINT FK_mycloset_cst_sm_id_smmember FOREIGN KEY (cst_sm_id)
        REFERENCES smmember (sm_id)
/

ALTER TABLE mycloset
    ADD CONSTRAINT FK_mycloset_cst_cl_id_clothes_ FOREIGN KEY (cst_cl_id)
        REFERENCES clothes (cl_pid)
/


-- smmember Table Create SQL
CREATE TABLE reply
(
    re_id           number(8)        NOT NULL, 
    re_writer       VARCHAR2(18)     NULL, 
    re_text         VARCHAR2(900)    NULL, 
    re_writedate    DATE             NULL, 
    re_select       NUMBER(8)        NULL, 
    re_tup          number(8)        NULL, 
    CONSTRAINT REPLY_PK PRIMARY KEY (re_id)
)
/

CREATE SEQUENCE reply_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER reply_AI_TRG
BEFORE INSERT ON reply 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT reply_SEQ.NEXTVAL
    INTO :NEW.re_id
    FROM DUAL;
END;
/

ALTER TABLE reply
    ADD CONSTRAINT FK_reply_re_select_board_id FOREIGN KEY (re_select)
        REFERENCES board (id)
/

ALTER TABLE reply
    ADD CONSTRAINT FK_reply_re_writer_smmember_sm FOREIGN KEY (re_writer)
        REFERENCES smmember (sm_id)
/

----------------------------------------------------------------------------------------------------------------------
-- 각 테이블 칼럼 명 확인
select * from smmember;
select * from clothes;
select * from mycloset;
select * from board;
select * from reply;

-- *** 각 테이블 지우기 (주의 할 것)
Drop Table smmember;
Drop Table clothes;
Drop Table mycloset;
Drop Table board;
Drop Table reply;