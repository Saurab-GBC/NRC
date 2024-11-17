-- Query to find assignments for COMP1234
SELECT title, due_date
FROM assignments
WHERE course_id = 'COMP1234';

-- Query to find the earliest assignment due date
SELECT min(due_date) AS earliest_due_date
FROM assignments;

-- Query to find the latest assignment due date
SELECT max(due_date) AS latest_due_date
FROM assignments;

-- Query to find assignments due on 2024-10-08
SELECT title, course_id
FROM assignments
WHERE due_date = '2024-10-08';

-- Query to find assignments due in October 2024
SELECT title, due_date
FROM assignments
WHERE due_date LIKE '2024-10%';

-- Query to find the most recent completed assignment
SELECT max(due_date) AS most_recent_completed
FROM assignments
WHERE status = 'Completed';

--optional Queries
-- Query to count assignments with "Not Started" status
SELECT count(*) AS not_started_count
FROM assignments
WHERE status = 'Not Started';

-- Query to find courses with labs on Tuesday
SELECT course_id, course_name
FROM courses
WHERE lab_day LIKE 'Tue%';

-- Query to join courses and assignments tables
SELECT c.course_id, c.course_name, a.title, a.due_date, a.status
FROM courses c
JOIN assignments a
  ON c.course_id = a.course_id;

