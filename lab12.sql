-- Query 1: Display all courses
SELECT * FROM courses;

-- Query 2: Display first 10 assignments
SELECT * FROM assignments
LIMIT 10;

-- Query 3: Count total number of courses
SELECT count(*) FROM courses;

-- Query 4: Find the earliest due date in assignments
SELECT min(due_date) FROM assignments;

-- Query 5: Select courses with names starting with 'Intro'
SELECT *
FROM courses
WHERE course_name LIKE 'Intro%';

-- Query 6: Assignments not completed, ordered by due date
SELECT *
FROM assignments
WHERE status != 'Completed'
ORDER BY due_date;

-- Query 7: Filter assignments by course ID and status
SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'
  AND course_id LIKE 'COMM%'
  AND due_date < '2024-12-31'
ORDER BY due_date;

-- Query to find assignments for COMP1234
SELECT title, due_date
FROM assignments
WHERE course_id = 'COMP1234';

-- Concatenate course_name and semester with a hyphen
SELECT course_name || ' - ' || semester AS course_and_semester
FROM courses;

-- Find courses with labs scheduled on Friday
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE '%Friday%';

-- List assignments with due_date after the current date
SELECT *
FROM assignments
WHERE due_date > date('now');

-- Count the number of assignments for each status
SELECT status, COUNT(*) AS count
FROM assignments
GROUP BY status;

--saurab bhattarai khatri
--I liked this query the most.
-- Find the course with the longest course_name
SELECT course_name, LENGTH(course_name) AS length
FROM courses
ORDER BY length DESC
LIMIT 1;

-- Return a list of all course names in uppercase
SELECT UPPER(course_name) AS upper_course_name
FROM courses;

-- List assignments due in September
SELECT title
FROM assignments
WHERE due_date LIKE '____-09-%';

-- Find assignments where the due_date is missing
SELECT *
FROM assignments
WHERE due_date IS NULL;

--optional tasks
-- List each course_id with the total number of assignments
SELECT courses.course_id, COUNT(assignments.id) AS total_assignments
FROM courses
LEFT JOIN assignments ON courses.course_id = assignments.course_id
GROUP BY courses.course_id;

-- Find courses without any assignments
SELECT courses.course_id, courses.course_name
FROM courses
LEFT JOIN assignments ON courses.course_id = assignments.course_id
WHERE assignments.id IS NULL;
