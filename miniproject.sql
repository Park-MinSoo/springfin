-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

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
/

COMMENT ON TABLE smmember IS '회원 맴버 테이블'
/

COMMENT ON COLUMN smmember.sm_id IS '회원 id'
/

COMMENT ON COLUMN smmember.sm_pwd IS '회원 password'
/

COMMENT ON COLUMN smmember.nic IS '회원 닉네임'
/

COMMENT ON COLUMN smmember.name IS '회원 실제 이름'
/

COMMENT ON COLUMN smmember.age IS '회원 나이'
/

COMMENT ON COLUMN smmember.height IS '회원 신장'
/

COMMENT ON COLUMN smmember.weight IS '회원 몸무게'
/

COMMENT ON COLUMN smmember.gender IS '회원 성별'
/

COMMENT ON COLUMN smmember.joindate IS '회원가입 날짜'
/

COMMENT ON COLUMN smmember.stylepoint IS '회원 style point 점수'
/

COMMENT ON COLUMN smmember.address IS '회원 거주지 주소'
/


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
/

COMMENT ON TABLE clothes IS '의류 상품 정보 테이블'
/

COMMENT ON COLUMN clothes.cl_pid IS '상품 번호'
/

COMMENT ON COLUMN clothes.cl_type IS '의상 종류'
/

COMMENT ON COLUMN clothes.cl_color IS '의상 색상'
/

COMMENT ON COLUMN clothes.cl_tpo IS '의상 tpo'
/

COMMENT ON COLUMN clothes.cl_fabric IS '의상 재질'
/

COMMENT ON COLUMN clothes.cl_uri IS '매핑 URI'
/


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

--DROP TRIGGER board_AI_TRG;
/

--DROP SEQUENCE board_SEQ;
/

COMMENT ON TABLE board IS '통합게시판'
/

COMMENT ON COLUMN board.id IS '통합 관리용 sequence id'
/

COMMENT ON COLUMN board.writer IS '작성자'
/

COMMENT ON COLUMN board.title IS '제목'
/

COMMENT ON COLUMN board.content IS '내용'
/

COMMENT ON COLUMN board.writedate IS '작성일'
/

COMMENT ON COLUMN board.cnt IS '조회수'
/

COMMENT ON COLUMN board.tup IS '추천수'
/

COMMENT ON COLUMN board.type IS '게시판 종류'
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

COMMENT ON TABLE mycloset IS '나만의 옷장'
/

COMMENT ON COLUMN mycloset.cst_sm_id IS '맴버용 id'
/

COMMENT ON COLUMN mycloset.cst_cl_id IS '의류용 pid'
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

--DROP TRIGGER reply_AI_TRG;
/

--DROP SEQUENCE reply_SEQ;
/

COMMENT ON TABLE reply IS '댓글 테이블'
/

COMMENT ON COLUMN reply.re_id IS '댓글 관리용 sequence id'
/

COMMENT ON COLUMN reply.re_writer IS '작성자'
/

COMMENT ON COLUMN reply.re_text IS '내용'
/

COMMENT ON COLUMN reply.re_writedate IS '작성일'
/

COMMENT ON COLUMN reply.re_select IS '게시글 분류용'
/

COMMENT ON COLUMN reply.re_tup IS '추천수'
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