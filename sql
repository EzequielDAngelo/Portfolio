--creación de la tabla.

CREATE TABLE courses (
institution VARCHAR2(500),
course_number VARCHAR2(500),
launch_date VARCHAR2(500),
course_title VARCHAR2(500),
instructors VARCHAR2(500),
course_subject VARCHAR2(500),
n_year VARCHAR2(500),
honor_code VARCHAR2(500),
participants VARCHAR2(500),
audited VARCHAR2(500),
certified VARCHAR2(500),
audited_percentage VARCHAR2(500),
cerified_percentage VARCHAR2(500),
certified_percentage2 VARCHAR2(500),
played_video_percentage VARCHAR2(500),
posted_forum_percentage VARCHAR2(500),
grade_greater0_percentage VARCHAR2(500),
course_hours_thousands VARCHAR2(500),
median_hours_certification VARCHAR2(500),
median_age VARCHAR2(500),
male_percentage VARCHAR2(500),
female_percentage VARCHAR2(500),
bachelors_degree_percentage VARCHAR2(500));
CREATE TABLE course (
institution VARCHAR2(500),
course_number VARCHAR2(500),
launch_date DATE,
course_title VARCHAR2(500),
instructors VARCHAR2(500),
course_subject VARCHAR2(500),
n_year NUMBER,
honor_code NUMBER,
participants NUMBER,
audited NUMBER,
certified NUMBER,
audited_percentage NUMBER,
cerified_percentage NUMBER,
certified_percentage2 NUMBER,
played_video_percentage NUMBER,
posted_forum_percentage NUMBER,
grade_greater0_percentage NUMBER,
course_hours_thousands NUMBER,
median_hours_certification NUMBER,
median_age NUMBER,
male_percentage NUMBER,
female_percentage NUMBER,
bachelors_degree_percentage NUMBER);



--pasaje de la infromación de una tabla a la otra

INSERT INTO COURSE
    (INSTITUTION,
     COURSE_NUMBER,
     LAUNCH_DATE,
     COURSE_TITLE,
     INSTRUCTORS,
     COURSE_SUBJECT,
     N_YEAR,
     HONOR_CODE,
     PARTICIPANTS,
     AUDITED,
     CERTIFIED,
     AUDITED_PERCENTAGE,
     CERIFIED_PERCENTAGE,
     CERTIFIED_PERCENTAGE2,
     PLAYED_VIDEO_PERCENTAGE,
     POSTED_FORUM_PERCENTAGE,
     GRADE_GREATER0_PERCENTAGE,
     COURSE_HOURS_THOUSANDS,
     MEDIAN_HOURS_CERTIFICATION,
     MEDIAN_AGE,
     MALE_PERCENTAGE,
     FEMALE_PERCENTAGE,
     BACHELORS_DEGREE_PERCENTAGE)
    SELECT INSTITUTION,
           COURSE_NUMBER,
           TO_DATE(LAUNCH_DATE, 'MM,DD,RRRR'),
           COURSE_TITLE,
           INSTRUCTORS,
           COURSE_SUBJECT,
           N_YEAR,
           HONOR_CODE,
           PARTICIPANTS,
           AUDITED,
           CERTIFIED,
           AUDITED_PERCENTAGE,
           CERIFIED_PERCENTAGE,
           CERTIFIED_PERCENTAGE2,
           PLAYED_VIDEO_PERCENTAGE,
           POSTED_FORUM_PERCENTAGE,
           GRADE_GREATER0_PERCENTAGE,
           COURSE_HOURS_THOUSANDS,
           MEDIAN_HOURS_CERTIFICATION,
           MEDIAN_AGE,
           MALE_PERCENTAGE,
           FEMALE_PERCENTAGE,
           BACHELORS_DEGREE_PERCENTAGE
      FROM COURSES;



--Cantidad de alumnos anotados en cada area y ordenado de ---mayor a menor.
--Computer Science y Science, Technology, Engineering, and --Mathematics primeros. Pero son las areas con menos
--porcentaje de alumnos que lograron certificarse

SELECT COURSE_SUBJECT,
       COUNT(*) AS NUMBER_OF_COURSES,
       SUM(PARTICIPANTS) AS TOTAL_PARTICIPANTS,
       SUM(CERIFIED_PERCENTAGE) / COUNT(*) AS CERTIFIED_PERCENTAGE
  FROM COURSE
 GROUP BY COURSE_SUBJECT
 ORDER BY 3 DESC;



--Porcentaje de mujeres vs varones segun area.

SELECT COURSE_SUBJECT,
       COUNT(*) AS NUMBER_OF_COURSES,
       SUM(FEMALE_PERCENTAGE) / COUNT(*) AS FEMALE_PERCENTAGE,
       SUM(MALE_PERCENTAGE) / COUNT(*) AS MALE_PERCENTAGE
  FROM COURSE
 GROUP BY COURSE_SUBJECT
 ORDER BY 4 DESC;
