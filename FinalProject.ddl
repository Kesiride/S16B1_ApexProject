-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-04-20 19:06:26 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE Department CASCADE CONSTRAINTS ;

DROP TABLE History CASCADE CONSTRAINTS ;

DROP TABLE Parent_children CASCADE CONSTRAINTS ;

DROP TABLE Person CASCADE CONSTRAINTS ;

DROP TABLE Project CASCADE CONSTRAINTS ;

DROP TABLE Status CASCADE CONSTRAINTS ;

DROP TABLE pjct_per CASCADE CONSTRAINTS ;

CREATE TABLE Department
  (
    dept_id   INTEGER NOT NULL ,
    dept_no   INTEGER ,
    dept_name VARCHAR2 (20)
  ) ;
ALTER TABLE Department ADD CONSTRAINT Department_PK PRIMARY KEY ( dept_id ) ;


CREATE TABLE History
  (
    "date"             DATE NOT NULL ,
    history_id         INTEGER NOT NULL ,
    Person_person_id   INTEGER ,
    Project_project_id INTEGER ,
    Status_Status_ID   NUMBER NOT NULL
  ) ;
ALTER TABLE History ADD CONSTRAINT History_PK PRIMARY KEY ( history_id ) ;


CREATE TABLE Parent_children
  (
    parent_cn_id      INTEGER NOT NULL ,
    Person_person_id  INTEGER ,
    Person_person_id1 INTEGER
  ) ;
ALTER TABLE Parent_children ADD CONSTRAINT Parent_children_PK PRIMARY KEY ( parent_cn_id ) ;


CREATE TABLE Person
  (
    person_id          INTEGER NOT NULL ,
    "first-name"       VARCHAR2 (4000) ,
    "last-name"        VARCHAR2 (4000) ,
    home_address       VARCHAR2 (4000) ,
    zipcode            INTEGER ,
    previous_salary    INTEGER ,
    us_citizen         CHAR (1) ,
    salary             INTEGER ,
    salary_exception   CHAR (1) ,
    bonus              INTEGER ,
    interim_manager_id INTEGER ,
    president_id       INTEGER ,
    isFired            CHAR (1) ,
    "end-date-day"     INTEGER ,
    Person_person_id   INTEGER ,
    Project_project_id INTEGER ,
    type               VARCHAR2 (255) ,
    Department_dept_id INTEGER
  ) ;
CREATE UNIQUE INDEX Person__IDX ON Person
  (
    Person_person_id ASC
  )
  ;
ALTER TABLE Person ADD CONSTRAINT Person_PK PRIMARY KEY ( person_id ) ;


CREATE TABLE Project
  (
    project_id         INTEGER NOT NULL ,
    project_no         INTEGER ,
    project_title      VARCHAR2 (20) ,
    est_person_hours   INTEGER ,
    project_active     CHAR (1) ,
    end_date_month     INTEGER ,
    end_date_day       INTEGER ,
    end_date_year      INTEGER ,
    Project_project_id INTEGER ,
    Department_dept_id INTEGER ,
    Status_Status_ID   NUMBER
  ) ;
ALTER TABLE Project ADD CONSTRAINT Project_PK PRIMARY KEY ( project_id ) ;


CREATE TABLE Status
  (
    status      INTEGER NOT NULL ,
    rfe_status  VARCHAR2 (30) NOT NULL ,
    description VARCHAR2 (500) NOT NULL ,
    Status_ID   NUMBER NOT NULL
  ) ;
ALTER TABLE Status ADD CONSTRAINT Status_PK PRIMARY KEY ( Status_ID ) ;


CREATE TABLE pjct_per
  (
    pp_id              INTEGER NOT NULL ,
    Project_project_id INTEGER ,
    Person_person_id   INTEGER
  ) ;
ALTER TABLE pjct_per ADD CONSTRAINT pjct_per_PK PRIMARY KEY ( pp_id ) ;


ALTER TABLE History ADD CONSTRAINT History_Person_FK FOREIGN KEY ( Person_person_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE History ADD CONSTRAINT History_Project_FK FOREIGN KEY ( Project_project_id ) REFERENCES Project ( project_id ) ;

ALTER TABLE History ADD CONSTRAINT History_Status_FK FOREIGN KEY ( Status_Status_ID ) REFERENCES Status ( Status_ID ) ;

ALTER TABLE Parent_children ADD CONSTRAINT Parent_children_Person_FK FOREIGN KEY ( Person_person_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE Parent_children ADD CONSTRAINT Parent_children_Person_FKv1 FOREIGN KEY ( Person_person_id1 ) REFERENCES Person ( person_id ) ;

ALTER TABLE Person ADD CONSTRAINT Person_Department_FK FOREIGN KEY ( Department_dept_id ) REFERENCES Department ( dept_id ) ;

ALTER TABLE Person ADD CONSTRAINT Person_Person_FK FOREIGN KEY ( Person_person_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE Person ADD CONSTRAINT Person_Project_FK FOREIGN KEY ( Project_project_id ) REFERENCES Project ( project_id ) ;

ALTER TABLE Project ADD CONSTRAINT Project_Department_FK FOREIGN KEY ( Department_dept_id ) REFERENCES Department ( dept_id ) ;

ALTER TABLE Project ADD CONSTRAINT Project_Project_FK FOREIGN KEY ( Project_project_id ) REFERENCES Project ( project_id ) ;

ALTER TABLE Project ADD CONSTRAINT Project_Status_FK FOREIGN KEY ( Status_Status_ID ) REFERENCES Status ( Status_ID ) ;

ALTER TABLE pjct_per ADD CONSTRAINT pjct_per_Person_FK FOREIGN KEY ( Person_person_id ) REFERENCES Person ( person_id ) ;

ALTER TABLE pjct_per ADD CONSTRAINT pjct_per_Project_FK FOREIGN KEY ( Project_project_id ) REFERENCES Project ( project_id ) ;

CREATE SEQUENCE Status_Status_ID_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Status_Status_ID_TRG BEFORE
  INSERT ON Status FOR EACH ROW WHEN (NEW.Status_ID IS NULL) BEGIN :NEW.Status_ID := Status_Status_ID_SEQ.NEXTVAL;
END;
/


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
