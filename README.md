# 🧾 IT Resource Allocation & Cost Optimization 
_Analyzing IT Resource Allocation & Cost Optimization for cooperate IT environment

---

## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#business-problem">Business Problem</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools & Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#exploratory-data-analysis-eda">Exploratory Data Analysis (EDA)</a>
- <a href="#research-questions--key-findings">Research Questions & Key Findings</a>
- <a href="#final-recommendations">Final Recommendations</a>
- <a href="#author--contact">Author & Contact</a>

---
<h2><a class="anchor" id="overview"></a>Overview</h2>

This project models how IT resources(employees, skills, salaries) are allocates across multiple projects. It helps management analyze workforce utilization, identify underutilization or overload, calculate project costs, and track employee attrition trends.

---
<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>

This Project aims to:
- Which employees are over- or under-utilized?
- What are the most expensive projects and why?
- How does employee attrition affect ongoing projects?
- Are resources aligned with project priorities and budgets?
- Which departments have workload imbalances?

---
<h2><a class="anchor" id="dataset"></a>Dataset</h2>

- Multiple CSV files located in `C:\Users\ADMIN\Desktop\SQL-PROJECT` folder (employees, projects, employee_project)

---

<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- SQL Server (DDL, DML, Joins, Aggregates, CTEs)
- ER Diagrams for schema visualization
- CSV datasets for realistic project simulation

GitHub for version control
---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
it-resource-allocation-sql/
│
├── README.md
├── LICENSE
│
├── sql_scripts/
│   ├── create_tables.sql
│   ├── insert_data.sql
│   └── queries.sql
│
├── dataset/
│   ├── employees.sql
│   ├── projects.sql
│   └── employee_project.sql

```
---
<h2><a class="anchor" id="exploratory-data-analysis-eda"></a>Exploratory Data Analysis (EDA)</h2>

**Utilization Check → Employees below 50% workload flagged as underutilized.
**Overhead Detection → Some employees allocated 200+ hours per month (overloaded).
**Cost Distribution → Projects with senior developers had the highest costs.
---
<h2><a class="anchor" id="research-questions--key-findings"></a>Research Questions & Key Findings</h2>

**Underutilized Employees: 8 staff < 50% workload.
**Overloaded Employees: 5 staff > 160 hrs/month.

---
<h2><a class="anchor" id="final-recommendations"></a>Final Recommendations</h2>

--Balance workload by redistributing tasks.
--Monitor utilization to prevent burnout or inefficiency.
--Track attrition risk for long-duration projects.

---
<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>

**YUVASHREE J**   
📧 Email: yuvashreej718@gmail.com  
