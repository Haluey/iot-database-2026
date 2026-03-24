CREATE TABLE `Lecture` (
   `Lec_Cd`   CHAR(4)   NOT NULL,
   `Lec_Name`   VARCHAR(20)   NOT NULL,
   `Ins_No`   INT   NULL
);

CREATE TABLE `Student` (
   `Std_No`   INT   NOT NULL,
   `Std_Name`   VARCHAR(10)   NOT NULL,
   `Std_Tel`   VARCHAR(13)   NOT NULL
);

CREATE TABLE `Instructor` (
   `Ins_No`   INT   NOT NULL,
   `Ins_Name`   VARCHAR(10)   NOT NULL,
   `Ins_Tel`   VARCHAR(13)   NULL
);

CREATE TABLE `Enrollment` (
   `Std_No`   INT   NOT NULL,
   `Lec_Cd`   CHAR(4)   NOT NULL,
   `Enr_Dt`   DATETIME   NULL   DEFAULT NOW(),
   `Grade`   VARCHAR(2)   NULL
);

ALTER TABLE `Lecture` ADD CONSTRAINT `PK_LECTURE` PRIMARY KEY (
   `Lec_Cd`
);

ALTER TABLE `Student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
   `Std_No`
);

ALTER TABLE `Instructor` ADD CONSTRAINT `PK_INSTRUCTOR` PRIMARY KEY (
   `Ins_No`
);

ALTER TABLE `Enrollment` ADD CONSTRAINT `PK_ENROLLMENT` PRIMARY KEY (
   `Std_No`,
   `Lec_Cd`
);

ALTER TABLE `Lecture` ADD CONSTRAINT `FK_Instructor_TO_Lecture_1` FOREIGN KEY (
   `Ins_No`
)
REFERENCES `Instructor` (
   `Ins_No`
);

ALTER TABLE `Enrollment` ADD CONSTRAINT `FK_Student_TO_Enrollment_1` FOREIGN KEY (
   `Std_No`
)
REFERENCES `Student` (
   `Std_No`
);

ALTER TABLE `Enrollment` ADD CONSTRAINT `FK_Lecture_TO_Enrollment_1` FOREIGN KEY (
   `Lec_Cd`
)
REFERENCES `Lecture` (
   `Lec_Cd`
);