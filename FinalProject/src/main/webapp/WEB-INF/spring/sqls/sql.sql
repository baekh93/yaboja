DROP TABLE USERS;
DROP TABLE CHATTING;
DROP TABLE MATCHING;



CREATE TABLE CINEMA
(
    CINEMASEQ    NUMBER           NOT NULL, 
    CINEMA       VARCHAR2(20)     NULL, 
    LATITUDE     VARCHAR2(200)    NULL, 
    LONGITUDE    VARCHAR2(200)    NULL, 
    CONSTRAINT CINEMA_PK PRIMARY KEY (CINEMASEQ)
);
INSERT INTO CINEMA
VALUES(1,'강남CGV','1','1');
INSERT INTO CINEMA
VALUES(2,'역삼CGV','100','100');
INSERT INTO CINEMA
VALUES(3,'서초CGV','300','300');
SELECT * FROM CINEMA;

CREATE TABLE USERS(
    USERSEQ           NUMBER            NOT NULL, 
    USERID            VARCHAR2(200)     NULL, 
    USERPW            VARCHAR2(200)     NULL, 
    USERNAME          VARCHAR2(200)     NULL, 
    USERPROFILE       VARCHAR2(200)     NULL, 
    USERSEX           VARCHAR2(200)     NULL, 
    USERAGE           VARCHAR2(200)     NULL, 
    USERADDRESS       VARCHAR2(200)     NULL, 
    USEREMAIL         VARCHAR2(200)     NULL, 
    USEREMAILHASH     VARCHAR2(2000)    NULL, 
    USEREMAILCHECK    VARCHAR2(200)     NULL, 
    USERTEATHER1      NUMBER            NULL, 
    USERTEATHER2      NUMBER            NULL, 
    USERTEATHER3      NUMBER            NULL, 
    USERGRADE         VARCHAR2(200)     NULL, 
    CONSTRAINT USER_PK PRIMARY KEY (USERSEQ)
);

 SELECT * FROM TAB;
SELECT * FROM USERS;
 
ALTER TABLE USERS
    ADD CONSTRAINT FK_USERS_USERTEATHER1_CINEMA_C FOREIGN KEY (USERTEATHER1)
        REFERENCES CINEMA (CINEMASEQ);

ALTER TABLE USERS
    ADD CONSTRAINT FK_USERS_USERTEATHER2_CINEMA_C FOREIGN KEY (USERTEATHER2)
        REFERENCES CINEMA (CINEMASEQ);


ALTER TABLE USERS
    ADD CONSTRAINT FK_USERS_USERTEATHER3_CINEMA_C FOREIGN KEY (USERTEATHER3)
        REFERENCES CINEMA (CINEMASEQ);
SELECT * FROM USERS;




CREATE TABLE CHATTING(
    CHATSEQ        NUMBER            NOT NULL, 
    USERSEQ1       NUMBER            NOT NULL, 
    USERSEQ2       NUMBER            NOT NULL, 
    CHATCONTENT    VARCHAR2(2000)    NOT NULL, 
    CHATDATE       DATE              NOT NULL, 
    CHATCHECK      VARCHAR2(20)      NOT NULL, 
    CONSTRAINT CHATTING_PK PRIMARY KEY (CHATSEQ)
);
ALTER TABLE CHATTING
    ADD CONSTRAINT FK_CHATTING_USERSEQ1_USERS_USE FOREIGN KEY (USERSEQ1)
        REFERENCES USERS (USERSEQ);

ALTER TABLE CHATTING
    ADD CONSTRAINT FK_CHATTING_USERSEQ2_USERS_USE FOREIGN KEY (USERSEQ2)
        REFERENCES USERS (USERSEQ);
        
        
        
CREATE TABLE MATCHING(
    MATCHINGSEQ          NUMBER          NOT NULL, 
    MATCHINGWRITER       NUMBER          NULL, 
    MATCHINGAPPLICANT    NUMBER          NULL, 
    MATCHINGSTATE        VARCHAR2(20)    NULL, 
    WRITERNOTICE         VARCHAR2(20)    NULL, 
    APPLICANTNOTICE      VARCHAR2(20)    NULL, 
    MATCHINGDATE         DATE            NULL, 
    SELECTEDAPPLICANT    VARCHAR2(20)    NULL, 
    CONSTRAINT MATCHING_PK PRIMARY KEY (MATCHINGSEQ)
);
SELECT * FROM MATCHING;

CREATE TABLE MATCHINGBOARD(
    MATCHINGBOARD           NUMBER           NOT NULL, 
    MOVIESEQ                NUMBER           NOT NULL, 
    USERSEQ                 NUMBER           NOT NULL, 
    MATCHINGBOARDTITLE      VARCHAR2(200)    NOT NULL, 
    MATCHINGBOARDCONTENT    VARCHAR2(200)    NOT NULL, 
    MATCHINGBOARDDATE       DATE             NOT NULL, 
    CINEMASEQ               NUMBER           NOT NULL, 
    CONSTRAINT MATCHINGBOARD_PK PRIMARY KEY (MATCHINGBOARD)
   
);
SELECT * FROM MATCHINGBOARD;
DROP TABLE MATCHINGBOARD;

CREATE TABLE MOVIE
(
    MOVIESEQ      NUMBER            NOT NULL, 
    MOVIETITLE    VARCHAR2(200)     NULL, 
    RATING        VARCHAR2(20)      NULL, 
    GENRE         VARCHAR2(200)     NULL, 
    TIME          VARCHAR2(2000)    NULL, 
    PUPDATE       VARCHAR2(200)     NULL, 
    MOVIESTATE    VARCHAR2(200)     NULL, 
    DIRECTOR      VARCHAR2(200)     NULL, 
    ACTOR         VARCHAR2(2000)    NULL, 
    IMGURL        VARCHAR2(2000)    NULL, 
    CODE          VARCHAR2(200)     NULL, 
    CONSTRAINT MOVIE_PK PRIMARY KEY (MOVIESEQ)
);

SELECT USERNAME, MATCHINGBOARDTITLE, USERSEX, USERAGE, CINEMA, MOVIETITLE, MATCHINGBOARDDATE
  FROM USERS A, CINEMA B, MOVIE C, MATCHINGBOARD D
  WHERE A.USERSEQ = D.USERSEQ
  		AND B.CINEMASEQ = D.CINEMASEQ
  		AND C.MOVIESEQ = D.MOVIESEQ;
SELECT * FROM MOVIE;
INSERT INTO MOVIE VALUES(1,'태극기 휘날리며','8.8','액션','90분','2019-01-11','상영','김땡땡','김,이,박,배,최,정','URL','CODE')
INSERT INTO MOVIE VALUES(2,'아쿠아맨','6.8','코미디','112분','2019-01-15','상영','김땡똥','김,김,박,배,최,김','URL','CODE')

SELECT * FROM all_users;
SELECT * FROM MATCHINGBOARD;

INSERT INTO MATCHINGBOARD VALUES(1,2,1,'아쿠아맨 보실분구함','여자환영 신청 고고',SYSDATE,1);
INSERT INTO MATCHINGBOARD VALUES(2,1,2,'태극기휘날리며보실분 장돈건존쟐','남자환영 신청 고고',SYSDATE,2);
INSERT INTO MATCHINGBOARD VALUES(3,2,1,'태극기휘날리며도상관없음 보실분괌','여자환영 신청 고고',SYSDATE,1);
INSERT INTO MATCHINGBOARD VALUES(4,2,1,'ㅁㅁㄴㅇㅁㄴㅇㅁㄴㅇ','ㅁㄴㅇㅁㄴㅇㄴㅁㅇ고고',SYSDATE,2);

DELETE
FROM MATCHINGBOARD;

INSERT INTO USERS VALUES(1,'user1','1234','유저1','유저사진','남','20대후','경기도','aaa@naver.com','hash','1',1,2,3,'일반');
INSERT INTO USERS VALUES(2,'user2','1234','유저2','유저사진2','여','20대초','경기도','aaa@naver.com','hash','1',1,2,3,'일반');
INSERT INTO USERS VALUES(3,'user3','1234','유저삼','유저사진삼','여','20대중','서울','aaa@naver.com','hash','1',1,2,3,'일반');
