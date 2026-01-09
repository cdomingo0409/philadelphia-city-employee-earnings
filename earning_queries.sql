/* ============================================================
   Department Level QTD Compensation Summary
   Business Question:
   How is quarter-to-date (QTD) employee compensation distributed
   across the City of Philadelphia departments?
   ============================================================ */

/*


Purpose:

To look at how employee compenssation is spread across city departments including base pay, overtime,  longevity pay, and post separation payments.


Why this approach:
- The data is reported as quarter-to-be (QTD), aggregating by department provides a clear snapshot of payroll activity at this point in the quarter.
- Breaking coompensation into indvidual components makes it easier to see how departments differ in overtime use, longevity pay, and separation-related costs.
- COALESCE is used to treat missing values as zero and avoid skewing totals.

Design Choices:
- Compensation types are summed separately to highlight differences in how departments structure pay.
- Departments are ordered by total QTD compensation to quickly identify where most payroll spending occurs.
= Results reflect payroll activity as of the data extract date and should not be interpreted as annual salary totals.

*/


SELECT department_name,
ROUND(SUM(base_salary),2) AS base_qtd_total,
ROUND(SUM(COALESCE(overtime_gross_pay_qtd,0)),2) AS overtime_qtd_total,
ROUND(SUM(COALESCE(longevity_gross_pay_qtd,0)),2) AS longevity_qtd_total,
ROUND(SUM(COALESCE(post_separation_gross_pay_qtd,0)), 2) AS post_separation_qtd_total,
ROUND(SUM(base_gross_pay_qtd 
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd,0)
+ COALESCE(post_separation_gross_pay_qtd,0)), 2) AS total_comp_qtd
FROM employeeEarnings
GROUP BY department_name
ORDER BY total_comp_qtd DESC;





/* ============================================================
   DEPARTMENT COMPENSATION DRIVERS (QTD)
   Business Question:
   What is driving quarter-to-date (QTD) compensation within each
   City of Philadelphia department?
   ============================================================ */
/*


Purpose:

This query breaks down QTD employee compensation by department to understand which pay components contribute most to overall payroll costs.


Why this approach:
- Compensation is reported as QTD, so aggregating by department provide a consistent look for a given reporting period.
- Separating base pay, overtime, longevity, and post separation pay makes it easiery to identify departments that rely heavily on overtime or one time payments.
- COALESCE is used to treat missing values as zero so totals are not undestated.

Design Choices:
- Grouped at the department level to match how city payroll spending is typically reviewed.
- Can be filtered by calendar year and quarter for period comparison.
- Results are ordered by total QTD compensation to highlight the largest payroll cost drivers.
*/


SELECT department_name,
ROUND(SUM(base_gross_pay_qtd),2) AS base_qtd,
ROUND(SUM(overtime_gross_pay_qtd),2) AS overtime_qtd,
ROUND(SUM(longevity_gross_pay_qtd),2) AS longevity_qtd,
ROUND(SUM(post_separation_gross_pay_qtd),2) AS post_separation_qtd,
ROUND(SUM(base_gross_pay_qtd
+ COALESCE (overtime_gross_pay_qtd, 0)
+ COALESCE (longevity_gross_pay_qtd, 0)
+ COALESCE (post_separation_gross_pay_qtd, 0)
), 2) AS total_qtd_compensation
FROM employeeEarnings

-- filter that is locked to a single reporting period, can be added and modified if wanted
-- WHERE calendar_year = 2023
--  AND quarter = 1

GROUP BY department_name
ORDER BY total_qtd_compensation DESC;





/* ============================================================
   OVERTIME RELIANCE BY DEPARTMENT (QTD)
   Business Question:
   Which departments rely most heavily on overtime as a share
   of their total quarter-to-date (QTD) compensation?
   ============================================================ */
/*

Purpose:

This query calculates overtime as a percentage of total QTD compensation for each department to identify where overtime plays a meaningful role in overall payroll costs.

Why this approach:
- Looking at overtime as a percentage of total compensation provides better context than raw overtime dollars and allows fair comparison across departments of different sizes.
- Using QTD values provides a consistent snapshot of payroll activity for a given reporting period without implying annualized spending.
- COALESCE is used to treat missing overtime values as zero so totals are not understated.


Design Choices:
- Compensation components are combined into a single total to reflect the full payroll picture of each department.
- Overtime is expressed as a percentage to highlight reliance rather than scale.
- Results are grouped at the department level to match how city payroll spending is typically reviewed.
- Departments are ordered by overtime percentage to clearly highlight overtime heavy departments.

*/


SELECT department_name,
ROUND(SUM(COALESCE(overtime_gross_pay_qtd,0)),2) AS overtime_qtd,
ROUND(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd, 0)
 + COALESCE(longevity_gross_pay_qtd, 0)
+ COALESCE(post_separation_gross_pay_qtd, 0)
), 2) AS total_qtd_compensation,
ROUND(
100.0 * SUM(COALESCE(overtime_gross_pay_qtd,0)) / NULLIF(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd, 0)
+ COALESCE(post_separation_gross_pay_qtd, 0)
), 0), 2)AS overtime_pct_of_total

FROM employeeEarnings
-- filter that is locked to a single reporting period that can be changed if needed.
-- WHERE calendar_year = 2023
-- AND quarter = 1

   
GROUP BY department_name
ORDER BY overtime_pct_of_total DESC;





/* ============================================================
   SUPPLEMENTAL PAY IMPACT BY DEPARTMENT (QTD)
   Business Question:
   Do longevity or post-separation payments materially impact
   quarter-to-date (QTD) compensation totals for certain departments?
   ============================================================ */
/*

Purpose:

This query looks at how much longevity and post separation payments contributes to total QTD compentation at department level. The goal is to see where one-tiome or supplemental pay may be noticeably inflating quarterly totals.


Why this approach:
- Using percentages makes it easier to compare departments of different sizes.
- QTD values provide a clear snapshot for a given period without implying annual totals.
- COALESCE is used so missing values don't understate compensation.


Design Choices:
- Longevity and post separation pay are analyzed both individually and together to capture their combined impact.
- Departments are ranked by total supplemental pay share to highlight where non base compensation matters most.

*/


SELECT department_name,
ROUND(SUM(COALESCE(longevity_gross_pay_qtd, 0)),2) AS longevity_qtd,
ROUND(SUM(COALESCE(post_separation_gross_pay_qtd, 0)),2) AS post_separation_qtd,
ROUND(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd,0)
+ COALESCE(post_separation_gross_pay_qtd,0)),2) AS total_qtd_compensation,

ROUND(100.0*SUM(COALESCE(longevity_gross_pay_qtd,0))
/NULLIF(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd,0)
+ COALESCE(post_separation_gross_pay_qtd,0)),0), 2) AS longevity_pct,

ROUND(100.0*SUM(COALESCE(post_separation_gross_pay_qtd,0))
/NULLIF(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd,0)
+ COALESCE(post_separation_gross_pay_qtd,0)),0), 2) AS post_separation_pct,

ROUND(100.0*(SUM(COALESCE(post_separation_gross_pay_qtd,0)) 
+ SUM(COALESCE(longevity_gross_pay_qtd,0)))
/NULLIF(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd,0)
+ COALESCE(post_separation_gross_pay_qtd,0)),0), 2) AS supplemental_pct_of_total

FROM employeeEarnings

-- options that can be filtered if needed
-- WHERE calendar_year = 2021
-- AND quarter = 2

GROUP BY department_name
ORDER BY supplemental_pct_of_total DESC;





/* ============================================================
   COMPENSATION OVER TIME (QTD)
   Business Question:
   How do compensation totals and pay components change across
   reporting periods (2019-2025)
   ============================================================ */
/*

Purpose:

To compare QTD compensation across time by grouping results by calendar year and quarter. This makes it easy to see how overall payroll and pay components shift from period to period without mixing quarters together.


Why this approach?:
- QTD pay is already a time based snapshot, so grouping by year and quarter keeps the analysis consistent across the dataset.
- Looking at base, overtime, longevity, and post separation separately helps show what's actually driving changes in total compensation.
- COALESCE is used so missing values count as zero and totals arent accidentally undertstated.


Design choice:
- Grouping by calendar_year and quarter keeps the timeline clean and avoids implying annual totals.
- Total QTD compensation is calculated as the sum of base, overtime, longevity, and post separation to match how the dashboard a defines "total compensation."
- Results are ordered by year and quarter so the output is already timeline ready.

*/


-- Total QTD compensation and other components for each reporting period
SELECT calendar_year, quarter,
ROUND(SUM(base_gross_pay_qtd), 2) AS base_qtd,
ROUND(SUM(COALESCE(overtime_gross_pay_qtd, 0)), 2) AS overtime_qtd,
ROUND(SUM(COALESCE(longevity_gross_pay_qtd, 0)), 2) AS longevity_qtd,
ROUND(SUM(COALESCE(post_separation_gross_pay_qtd, 0)), 2) AS post_separation_qtd,
ROUND(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd, 0)
+ COALESCE(post_separation_gross_pay_qtd,0)), 2) AS total_qtd_compensation
FROM employeeEarnings
GROUP BY calendar_year, quarter
ORDER BY calendar_year, quarter;


-- shows which department changes across periods and by how much
SELECT calendar_year, quarter, department_name,
ROUND(SUM(base_gross_pay_qtd
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd, 0)
+ COALESCE(post_separation_gross_pay_qtd,0)), 2) AS total_qtd_compensation
FROM employeeEarnings
GROUP BY calendar_year, quarter,department_name
ORDER BY calendar_year, quarter, total_qtd_compensation DESC;






















