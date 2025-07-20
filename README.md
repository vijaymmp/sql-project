# Learning & Productivity Tracker Project Documentation

---

## Project Overview

This project, titled **Learning & Productivity Tracker**, is designed to monitor and analyze students' study sessions, productivity activities, mood, sleep, energy levels, and academic performance. The primary objective is to derive insights into how these factors influence academic success and personal productivity. This system can assist educators and students in understanding behavior patterns that impact learning efficiency and outcomes.

Use Cases:

* Assisting students in identifying optimal study patterns.
* Helping educators understand student behaviors linked to performance.
* Providing insights for wellness programs targeting student well-being.

---

## Technologies Used

* **Database:** MySQL
* **Design Tool:** MySQL Workbench (`project1.mwb`)
* **SQL Script:** Provided in `pro.sql`
* **Visualization (Optional):** Power BI / Excel
* **Version Control:** GitHub (for project versioning and documentation)

---

## Database Design (ER Model)

The database consists of 5 primary tables designed to capture diverse aspects of a student's academic and productivity life.

### 1. Users

Stores basic information about each student, including:

* `user_id` (Primary Key)
* `name`
* `age`
* `education_level`

### 2. Study\_Sessions

Tracks each study session with details:

* `session_id` (Primary Key)
* `user_id` (Foreign Key)
* `subject`
* `hours_spent`
* `session_date`

### 3. Productivity\_Log

Logs productivity activities such as:

* `log_id` (Primary Key)
* `user_id` (Foreign Key)
* `task_name`
* `task_type`
* `duration_hours`
* `focus_level`
* `log_date`

### 4. Academic\_Scores

Records academic performance per subject:

* `score_id` (Primary Key)
* `user_id` (Foreign Key)
* `subject`
* `score`
* `test_date`

### 5. Daily\_Reflections

Captures daily reflections on well-being:

* `reflection_id` (Primary Key)
* `user_id` (Foreign Key)
* `reflection_date`
* `mood_score`
* `energy_level`
* `sleep_hours`

### ER Diagram

Refer to `project1.mwb` for the complete ER diagram illustrating relationships between tables.

---

## SQL Script (`pro.sql`)

This script encompasses:

* **Database & Table Creation:** Users, Study\_Sessions, Productivity\_Log, Academic\_Scores, Daily\_Reflections
* **Data Insertion:** Sample data for all tables to simulate realistic scenarios.
* **Analytical Queries:**

  * Total study hours by subject
  * Average focus by task type
  * Mood and energy trends
  * Ranking students by total marks (RANK function)
  * Identifying highest scoring subject per user (ROW\_NUMBER)
  * Relationship between sleep hours and academic scores
  * Productivity metrics per user

---

## Sample Queries & Their Purpose

1. **Total Study Hours per Subject:** Summarize study effort per subject.
2. **Average Focus Level by Task Type:** Evaluate which tasks improve focus.
3. **Mood Trends Over Time:** Analyze mood progression day by day.
4. **Ranking Students by Total Academic Score:** Identify top-performing students.
5. **Highest Scoring Subject per User:** Determine each user's strongest subject.
6. **Sleep Hours vs Average Academic Score:** Examine if sleep correlates with better scores.
7. **Productivity Summary per User per Day:** Track daily productivity levels.
8. **Average Focus Level per User:** Rank users based on average focus levels.

---

## Insights Derived

* Increased sleep hours tend to correlate with better mood and energy.
* Higher focus levels are task-dependent.
* A consistent study routine leads to better academic scores.
* Productivity varies daily but shows trends when analyzed alongside mood and energy data.

---

## How to Run This Project

1. **Database Setup:**

   * Open `project1.mwb` in MySQL Workbench to visualize and understand database structure.
   * Run `pro.sql` in MySQL Workbench to create tables and insert sample data.

2. **Query Execution:**

   * Execute the provided SQL queries to perform analysis.
   * Modify queries to tailor analysis as needed.

3. **Visualization (Optional):**

   * Export query results as CSV files.
   * Use Power BI or Excel for visual analysis and dashboards.

---

## Optional Enhancements

* **Advanced Analytics:** Integrate machine learning for predictive analytics.
* **Automated Reports:** Implement stored procedures for periodic reporting.
* **Visualization Dashboards:** Build dynamic dashboards in Power BI.
* **Expand Dataset:** Add more user data for comprehensive analysis.

---



## Conclusion

This project provides a structured approach to monitoring and analyzing factors affecting student productivity and academic performance. Through a relational database model, various analytical queries help uncover patterns and correlations that can be used to improve learning strategies and overall well-being.

Key Findings:

* Strong correlation between sleep and energy/mood.
* Consistent studying leads to better academic outcomes.
* Productivity patterns vary but can inform better personal habits.

---

**Author:** Vijay

