-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

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

COMMENT ON TABLE smmember IS 'ȸ�� �ɹ� ���̺�'
/

COMMENT ON COLUMN smmember.sm_id IS 'ȸ�� id'
/

COMMENT ON COLUMN smmember.sm_pwd IS 'ȸ�� password'
/

COMMENT ON COLUMN smmember.nic IS 'ȸ�� �г���'
/

COMMENT ON COLUMN smmember.name IS 'ȸ�� ���� �̸�'
/

COMMENT ON COLUMN smmember.age IS 'ȸ�� ����'
/

COMMENT ON COLUMN smmember.height IS 'ȸ�� ����'
/

COMMENT ON COLUMN smmember.weight IS 'ȸ�� ������'
/

COMMENT ON COLUMN smmember.gender IS 'ȸ�� ����'
/

COMMENT ON COLUMN smmember.joindate IS 'ȸ������ ��¥'
/

COMMENT ON COLUMN smmember.stylepoint IS 'ȸ�� style point ����'
/

COMMENT ON COLUMN smmember.address IS 'ȸ�� ������ �ּ�'
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

COMMENT ON TABLE clothes IS '�Ƿ� ��ǰ ���� ���̺�'
/

COMMENT ON COLUMN clothes.cl_pid IS '��ǰ ��ȣ'
/

COMMENT ON COLUMN clothes.cl_type IS '�ǻ� ����'
/

COMMENT ON COLUMN clothes.cl_color IS '�ǻ� ����'
/

COMMENT ON COLUMN clothes.cl_tpo IS '�ǻ� tpo'
/

COMMENT ON COLUMN clothes.cl_fabric IS '�ǻ� ����'
/

COMMENT ON COLUMN clothes.cl_uri IS '���� URI'
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

COMMENT ON TABLE board IS '���հԽ���'
/

COMMENT ON COLUMN board.id IS '���� ������ sequence id'
/

COMMENT ON COLUMN board.writer IS '�ۼ���'
/

COMMENT ON COLUMN board.title IS '����'
/

COMMENT ON COLUMN board.content IS '����'
/

COMMENT ON COLUMN board.writedate IS '�ۼ���'
/

COMMENT ON COLUMN board.cnt IS '��ȸ��'
/

COMMENT ON COLUMN board.tup IS '��õ��'
/

COMMENT ON COLUMN board.type IS '�Խ��� ����'
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

COMMENT ON TABLE mycloset IS '������ ����'
/

COMMENT ON COLUMN mycloset.cst_sm_id IS '�ɹ��� id'
/

COMMENT ON COLUMN mycloset.cst_cl_id IS '�Ƿ��� pid'
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

COMMENT ON TABLE reply IS '��� ���̺�'
/

COMMENT ON COLUMN reply.re_id IS '��� ������ sequence id'
/

COMMENT ON COLUMN reply.re_writer IS '�ۼ���'
/

COMMENT ON COLUMN reply.re_text IS '����'
/

COMMENT ON COLUMN reply.re_writedate IS '�ۼ���'
/

COMMENT ON COLUMN reply.re_select IS '�Խñ� �з���'
/

COMMENT ON COLUMN reply.re_tup IS '��õ��'
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
-- �� ���̺� Į�� �� Ȯ��
select * from smmember;
select * from clothes;
select * from mycloset;
select * from board;
select * from reply;

-- *** �� ���̺� ����� (���� �� ��)
Drop Table smmember;
Drop Table clothes;
Drop Table mycloset;
Drop Table board;
Drop Table reply;